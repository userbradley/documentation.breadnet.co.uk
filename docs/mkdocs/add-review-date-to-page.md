---
title: Add review date to page
reviewdate: '2023-10-22'
---

## Why

When maintaining a site that people rely on, you need to ensure that people can easily see the validity of the information presented to them.

By adding a banner at the top of the page explaining that the page has not been reviewed recently, it builds more trust

## How

### On the header of the page

When creating a page on this site, the first few lines are yaml

Include the below

``` diff
title: Add review date to page
+reviewdate: '2023-10-22'
```

!!! example "Formatting the page"

    - Ensure that the date is surrounded with `'` otherwise we get an error
    - Do not use `#` (`h1`) or it will break the formatting


Your page should look like the below

```markdown
---
title: Add review date to page
reviewdate: '2023-10-22'
---

## Why
```

## See it in actions

- [Example expired page](expired-page-example.md)


## Troubleshooting

### TypeError: '<'

#### Full error

```text
TypeError: '<' not supported between instances of 'datetime.date' and 'str'
```

#### Resolution

```diff
-reviewdate: 2023-10-22
+reviewdate: '2023-10-22'
```
