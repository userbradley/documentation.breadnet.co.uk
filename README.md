# [breadNET Documentation](https://documentation.breadnet.co.uk)
[![Codefresh build status]( https://g.codefresh.io/api/badges/pipeline/breadnet/Static%20sites%2FDocumentation?type=cf-2&key=eyJhbGciOiJIUzI1NiJ9.NjA2NDk2ODIzMDk5OTgxZTRjODFmMTNi.5gYRawM6ODqOOVHDq1eDn1cma2Df2_jcXcQ4oAsb9wM)]( https://g.codefresh.io/pipelines/edit/new/builds?id=63332e88189958204cec2b93&pipeline=Documentation&projects=Static%20sites&projectId=6182852a9c76740876ee5660)

This repo houses all the public documentation that I have created over the years, recently migrated to mkdocs

## Why `mkdocs`

I have decided to go with `mkdocs` as it has a really easy to use admin interface.

That was a joke. The real reason is the lack of admin interface. It reduces the attack vector and also means that I can
edit the files anywhere I have access to git.

I hardly find my self editing files away from home, so I'm not too stressed.

## Why Migrate

As mentioned, I am fed-up with Bookstack and administering it.

I love Bookstack. 100% - But the issue is I have outgrown the need to have a full-fledged CMS with user permissions etc.

I think this is just me getting more mature and resizing that a full CMS is not needed. 

# Contribute

I encourage people to contribute to this. 

You can do so by making a fork of this to your own account, making the changes and then open a PR in to DEV.

# Uptime 

My Bookstack site will not remain active once the migration is complete.

All pages that are migrated will redirect to their new home.

Once the migration is complete, `bookstack.breadnet.co.uk` will redirect to `documentation.breadnet.co.uk`

# Migration plan

The below has the assumption that the new mkdocs project is created, and there is a staging site

1. Export list of slugs from bookstack (sql)
2. Export HTML of each page (sql)
3. `HTML` to `markdown`
4. Create pages
5. Create navigation

# Branches

## master

This branch houses the live site, available at [documentation.breadnet.co.uk](https://documentation.breadnet.co.uk)

The site is only built on PR merge to master

## dev

This branch houses the development site, which is built on each commit to `dev`

Site is available at `dev.documentation.breadnet.co.uk`