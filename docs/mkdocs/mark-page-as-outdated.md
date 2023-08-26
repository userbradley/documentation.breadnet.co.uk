---
title: Set page as permanently outdated
---


## Why

When maintaining a site that people rely on, you need to ensure that people can easily see the validity of the information presented to them.

By adding a banner at the top of the page explaining that the page is now outdated and will not be receiving updates, it enables people
to know they shouldn't 100% account on the details

## How

### On the header of the page

When creating a page on this site, the first few lines are yaml

Include the below

``` diff
title: Add review date to page
+outdated: true
```

!!! example "Formatting the page"

    - Ensure that the date is surrounded with `'` otherwise we get an error
    - Do not use `#` (`h1`) or it will break the formatting


Your page should look like the below

```markdown
---
title: Add review date to page
outdated: true
---

## Why
```

[Example Page](outdated-page-example.md)