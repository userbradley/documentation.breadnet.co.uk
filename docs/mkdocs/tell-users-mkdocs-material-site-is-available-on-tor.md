---
reviewdate: '2026-12-20'
title: Tell users MKDocs material site is available on TOR
---

## Why

If your Material for MKDocs site is available on TOR, you can advertise this to TOR compatible browsers

## How

### Theme Overrides

In your `mkdocs.yaml` file, add an overrides block

```diff
theme:
  name: material
+ custom_dir: overrides
```

In the root of the site repo, make a directory called `overrides`

### Overriding `main.html`

Creat a file called `main.html` in the `overrides` directory

Place the below in the `main.html` file

```jupyter
% extends "base.html" %}

{% block extrahead %}
{{ super() }}
<meta http-equiv="onion-location" content="http://<onion address>" />
{% endblock %}
```

### Testing it works

Once your site is pushed and deployed, open a TOR browser and you should see a pop-up like the below

![](../assets/486558279-c85f0dbf-fbdf-4a9a-8dda-840e9c4d1d4d.png)

## Read next

* [Install lyrebird on Alpine](../kb/tor/install-lyrebird-on-alpine.md)
