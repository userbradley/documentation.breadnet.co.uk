---
reviewdate: '2026-12-20'
title: Dell HDD password protected
---

## What

When buying second hand computers off eBay, sometimes a Dell system will come with the below

```text
Hard-drive #NZFN901636Z-6FF1, the system internal HDD-0, is protected by a password authentication system. You cannot access data on this hard drive without the correct password. Please type in the hard drive password
```

This guide will show you how to bypass this

## How

Make a note of the Serial number. In the below screenshot it is the number after `#`

![Dell this hdd is password protected](https://www.dell.com/community/assets/community/687062f5-603c-4f5f-ab9d-31aa7cacb376/HDD0Passwordrequiredafterrepla-673a4468-8764-4160-9f2f-b6023fa43635-237144337)

Navigate in your browser to [bios-pw.org](https://bios-pw.org)

Type the ID in, and click `get password`

![bios pw get password](../../assets/dell-hdd-password-protected.png)

Type the password in, and most importantly press **ctrl + enter**

Your system should now boot normally
