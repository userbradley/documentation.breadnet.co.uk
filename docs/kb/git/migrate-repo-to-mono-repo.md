---
title: Migrate repo to Mono-repo
---

# Migrate repo to Mono-repo



## Set up your git remote

You’ll need to add a new remote for the repo you want to migrate, because you can’t just mv codebase without losing all the commits. Let’s say I’ve got my React app in a repo called persephone:

```
git remote add persephone git@github.com:lgtm/persephone
```


## Fetch the code from the remote


Next, you need to grab the code without checking out the branch. This is so git is aware of what you’re planning to merge in. Like above, you can automate this:

```
git fetch persephone
```


## Read the commits from the remote repo into your new one


If you have any open PRs in your old repo I suggest you merge them before continuing, because you’ll have a bit more trouble if you’ve taken this step and need to update with fresh commits.

```
git read-tree --prefix=src/persephone --u persephone/master
```

This is copying git’s history from the master branch in your remote repo into a specific directory in your new one (--prefix means it will stick the supplied path to the beginning of each filepath in the tree). Even for ancient repos this shouldn’t take more than a couple of seconds.

!!! warning "Beware of the `.gitignore`"

    Double check the correctness of your .gitignore files in each repo. If you have added lines to that file but the ignored files are still committed inside the remote for some reason (e.g. maybe you committed a sensitive file, ignored it after the fact, and forgot to remove the file from git), they will not be copied in. This may lead to bizarre, head-scratching errors when a file that should be there suddenly isn’t, and you will otherwise have to adapt your setup to put those files in the right place in your monorepo. You wouldn’t expect the repository metadata to be the source of a bug, after all.

## Commit the changes

Even though you’re reproducing the history of one repo inside another, unrelated one, you’ve still got to add a commit at the end to seal the deal.

```
git add src/persephone
git commit -m "Migrate persephone repo to src/persephone"
```

## Rebase into master

Provided you did this in a branch, so you could encapsulate it in a PR, it is absolutely vital that you merge it into master by rebasing. Make sure you’re all up to date and nothing else has been merged meanwhile, otherwise you’re going to have to re-apply those lost commits.

```
git checkout master
git pull --rebase
git rebase monorepo-branch
git push --force
```

The force push will probably set alarm bells ringing in most people, but you just copied the entire history of several repos into a new one, meaning that all of those commits happened well into the past and almost definitely before whatever else has been committed inside the new repo. Just make sure to co-ordinate the merge and do it in a quiet moment. This may also mean that you have to disable branch protection for a short while.

## What if I don’t want to rebase?

Then you get a massive merge commit, which probably isn’t too helpful, or otherwise the history of several repos squashed into a single commit, which is totally useless.

### Deal with the rest of the transition

Many third party integrations assume that one project is equal to one repo, and might not support the monorepo use-case at all. In any case, you’re going to have to reconfigure your CI pipelines to work with your new setup since you can’t assume that anything lives in the repo root anymore.

It’s prudent to do this as part of the monorepo PR you have going on, but of course those commits will become difficult to review if you’re migrating any significant number of commits.

Our own monorepo migration resulting in building a local CLI suite that abstracted most of the commands for testing, building and deploying the few services we have. This simplified the config with CircleCI quite considerably, as otherwise the YAML file would be practically unmaintainable. If you’re not using a build system like Make, or you’re juggling a couple of them because one service uses Go and another use Node or whatever, it would be worth having a top-level system to co-ordinate all of that.

#### Copying existing PRs

If you did this migration while some PRs were still left hanging, you’re not totally screwed. There are solutions to migrating those branches without losing the commit history (using git filter-branch), but if you’ve got more than a couple of PRs to handle it’s going to be fiddly work.

A quicker solution, at the expense of losing history and author information, is to apply a patch. You can get one for a PR by adding .diff to the end of the URL, and saving the contents to a file (let’s call it pr_patch). You can link to the original PR and stuff in the commit message, which is just-about good enough.

###### assuming pr_patch exists with PR diff

```
git apply pr_patch --directory=src/persephone
rm pr_patch
git commit...
```

[Additional Reading](https://medium.com/lgtm/migrating-to-the-monorepo-582106142654)
