---
title: Bookstack
reviewdate: '2022-01-01'
---

# Bookstack

How to enable `Dark Mode` on Bookstack

!!! Note
    This was used before bookstack had a dark theme. Do not use!

```css
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.29.0/theme/blackboard.min.css"/>
<script>window.codeTheme='blackboard';</script>

<link rel="stylesheet" href="https://bookstack.breadnet.co.uk/css/dark-theme.css">

<style>
code {color:#50fa7b;background-color:#282b36;white-space:pre-line;}
.page-content del {background: #FF5555!important;}
.card .entity-list-item:not(.no-hover):hover {background-color: #44475a !important;}
.page-content ins {background: #50fa7b!important;color: #282a36!important;}
.suggestion-box {background-color: #282a36!important;border: 1px solid #BBB;box-shadow: none!important;border-radius: 0!important;}
.suggestion-box li:last-child {border-bottom: 0; }
.suggestion-box li.active {background-color: #44475a!important;}
.card .entity-list-item:not(.no-hover):hover {background-color: #44475a!important;}
.card-title {text-transform: uppercase;color: #f8f8f2;fill: #f8f8f2;font-weight: 400;}
.markdown-editor-display{background-color: #282a36;}
.markdown-editor-display body {background-color: #282a36;}
.breadcrumb-listing-entity-list {background-color:#282a36 !important;}
.breadcrumb-listing .breadcrumb-listing-toggle:hover {fill: #f8f8f2;border-color: transparent;}
.entity-meta {fill:#f8f8f2!important;}
.book-tree .sidebar-page-list .entity-list-item.selected {background-color:#44475a;}
table.table tr:hover {background-color:#44475a;}
.tri-layout-mobile-tab:first-child {border-right: 0;background: #282a36;}
.tri-layout-mobile-tab {text-align: center;border-bottom: 0;cursor: pointer;background: #282a36;}
.tri-layout-mobile-tab.active {border-bottom-color: none;background: #44475a;}
.tri-layout-mobile-tabs {border:0;}
.entity-selector .entity-list-item {background-color:#282a36;}
.entity-selector {border:0}
blockquote{border-left: 4px solid #8be9fd;background-color: transparent!important;}
header .header-links {background-color: transparent;}
header .links a:hover, header .dropdown-container ul li a:hover {background-color:#44475a;}
@media screen and (max-width: 1000px) {header .header-links {background-color: #282a36;}}
</style>
```