---
title: Custom markdown Badges
---

To make a badge like the below:

![deutschebank](https://img.shields.io/badge/deutschebank-%230018A8.svg?style=for-the-badge&logo=deutschebank&logoColor=#0018A8)

## Find the Logo

Navigate to [Simple icons](https://simpleicons.org)

Make note of the Logo name. If you are struggling to find the name, go to their [git repo](https://github.com/simple-icons/simple-icons) and search for it

## Encode the color

On the left hand side of a `simpleicon` is the color code

![](/assets/amex-simpleicons.png)

Paste the copied value in to the below site and encode it

[https://meyerweb.com/eric/tools/dencoder/](https://meyerweb.com/eric/tools/dencoder/)

## Assemble the badge

```markdown
![<brand>](https://img.shields.io/badge/<brand>-<encoded value>.svg?style=for-the-badge&logo=<brand>&logoColor=<hex>)
```

Replace <brand> with the brands icon name

Example

```markdown
![deutschebank](https://img.shields.io/badge/deutschebank-%230018A8.svg?style=for-the-badge&logo=deutschebank&logoColor=#0018A8)
```
