---
reviewdate: '2026-12-20'
title: Collapsed Sections GitHub
---

## What

In GitHub Markdown, we can create collapsed sections

## How

~~~
<details>

<summary>Tips for collapsed sections</summary>

### You can add a header

You can add text within a collapsed section.

You can add an image or a code block, too.

```ruby
   puts "Hello World"
```

</details>
~~~

The Markdown inside the `<summary>` label will be collapsed by default:

![Screenshot of the Markdown above on this page as rendered on GitHub, showing a right-facing arrow and the header "Tips for collapsed sections."](../../assets/collapsed-section-view.webp)

After a reader clicks `>`, the details are expanded:

![Screenshot of the Markdown above on this page as rendered on GitHub, indicating that a collapsed section can contain headers, sentences of text, images, and code blocks.](../../assets/open-collapsed-section.webp)
