---
Title: "Projects, Resources, IAM Users, Roles, Permissions, APIs, and Cloud Shell"
reviewdate: '2022-01-01'
---

## Permissions


| Role Name    | Permissions                                                                                                                                                                                               |
|--------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| roles/viewer | Permissions for read-only actions that do not affect state, such as viewing (but not modifying) existing resources or data.                                                                               |
| roles/editor | All viewer permissions, plus permissions for actions that modify state, such as changing existing resources.                                                                                              |
| roles/owner  | All editor permissions and permissions for the following actions <ul><li>Manage roles and permissions for a project and all resources within the project.</li><li>Set up billing for a project.</li></ul> |

![](https://cdn.qwiklabs.com/BErmNT8ZIzd5yqxO0lEJj8lAlKT3jKC%2BtI%2Byj3OSKDA%3D)


Regions (Central US) are physical countries.

Zones are the data centre (Physical) like us-central1-a

follows country-zone-count


## gcloud

### List active account name

```bash
gcloud auth list
```

### List ProjectID
```bash
gloud config list project
```

### Creating an instance though the cloud command line

```bash
gloud compute instances create <name> --machine-type <machine type> --zone <see zone location>
```
