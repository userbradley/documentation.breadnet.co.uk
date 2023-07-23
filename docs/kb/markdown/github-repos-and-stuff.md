---
title: Github repo's and stuff
reviewdate: '2022-01-01'
---
# How to use git

To clone a repo, go to the webpage and click the `clone or download` button and click 'Use SSH'

??? Note "SSH or https"
    Seeing as you have `2fa` enabled on your account, you should be using `ssh` as it doesn't require you to log in each action you make

![](/assets/tjxlFRVsXUgsDatm-image-1588972001839.png)


Once you have the string on your clipboard open a terminal window and browse to a location where your code will now live. I use `~\github`

Run:

```shell
git clone git@github.com:<repo url>
```

Once cloned, go to its folder and edit the code to your hearts content

Once you're ready to push your code

```shell
git add <file's that changed>
```

```shell
git commit -m 'Added files/ refactored prd
```

```shell
git push
```