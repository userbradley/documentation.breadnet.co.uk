---
title: Grafeas
---

Can store the metadata in a range of databases:

* PostgreSQL
* BoltDB
* Spanner
* OracleDB

It defines an API for managing metadata for Software supply chain, including (but not limited to)

* Container images
* VM's
* .jar files
* scripts


it works by taking the metadata (The additional details about the files and packages) and splitting it in to:

* Notes
    * Notes are high level descriptions of a type of metadata
* Occurrences
    * Occurrences are instantiations (noun. Countable) of the Notes, and where they happen.

By doing this, it allows third party metadata providers to create and manage metadata.

Allows for fine-grained access to the types of metadata



Sources:

https://opensource.google/projects/grafeas
https://grafeas.io