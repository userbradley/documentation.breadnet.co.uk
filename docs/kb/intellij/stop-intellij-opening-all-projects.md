---
reviewdate: '2026-12-20'
title: Stop Intellij opening all projects
---

## What

IntelliJ by default opens all previous windows you've had open. This can cause issues if your laptop is already struggling
for resources and then opens 20 windows

## How

Edit the below file

Note: You will need to press tab for the Version number at the end.

```shell
nano ~/Library/Application Support/JetBrains/IntelliJIdea<version>/options
```

Add the `reopenLastProject`

```diff
<application>
  <component name="GeneralSettings">
    <option name="confirmOpenNewProject2" value="0" />
+   <option name="reopenLastProject" value="false" />
  </component>
  <component name="Registry">
    <entry key="moved.to.new.ui" value="true" source="SYSTEM" />
    <entry key="ide.experimental.ui" value="true" source="SYSTEM" />
  </component>
</application>
```
