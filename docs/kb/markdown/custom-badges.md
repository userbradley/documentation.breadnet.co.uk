---
title: Custom markdown Badges
---
# Custom markdown badges

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

Replace <brand> with the brands icon name.

??? note "Brand names with spaces"

    Where the brand has a space in the name, like `Pets at Home` you will need to use the 
    url encoded value of a space: `%20`
    
    It will look like `Pets%20at%20Home`

Example

```markdown
![deutschebank](https://img.shields.io/badge/deutschebank-%230018A8.svg?style=for-the-badge&logo=deutschebank&logoColor=#0018A8)
```


## Examples 

=== "Pets at Home"

    ![Pets at Home](https://img.shields.io/badge/Pets%20At%20Home-%23000000.svg?style=for-the-badge&logo=petsathome&logoColor=#4BA840)

    !!! note "About the Color"
        The background color is back as the brands image is the same as the background, thus causing it to look bad

=== "American Express"

    ![American Express](https://img.shields.io/badge/American%20Express-%23000000.svg?style=for-the-badge&logo=americanexpress&logoColor=#2E77BC)

    !!! note "About the Color"
        The background color is back as the brands image is the same as the background, thus causing it to look bad

=== "Deutsche Bank"
    
    ![deutschebank](https://img.shields.io/badge/deutschebank-%230018A8.svg?style=for-the-badge&logo=deutschebank&logoColor=#0018A8)