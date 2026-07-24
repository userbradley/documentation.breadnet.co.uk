---
title: Remove GPS data from Images using Exiftool
---

## What's the issue

When uploading an image to some services, or even sharing it with people it will include GPS data as well as other
information baked in to the image.

This is fine when sharing it with someone you trust, but if you upload it to an S3 bucket to share with more people
as I often do, then you run the risk of doxxing your self.

## Solution

We can use a tool called `exiftool` which gets its name from the data attached to images, called `Exchangable Image file format` or `EXIF` for shot

Replace `<image.jpg>` with the filename

```shell
exiftool -all= -overwrite_original_in_place <image.jpg>
exiftool -gps:all= <image.jpg>
exiftool "-gps*=" <image.jpg>
```

### Verify it worked

```shell
➜ exiftool back.JPG
ExifTool Version Number         : 13.55
File Name                       : back.JPG
Directory                       : .
File Size                       : 1624 kB
File Modification Date/Time     : 2026:04:29 01:47:17+01:00
File Access Date/Time           : 2026:04:29 01:53:42+01:00
File Inode Change Date/Time     : 2026:04:29 01:50:03+01:00
File Permissions                : -rw-------
File Type                       : JPEG
File Type Extension             : jpg
MIME Type                       : image/jpeg
Image Width                     : 3024
Image Height                    : 4032
Encoding Process                : Baseline DCT, Huffman coding
Bits Per Sample                 : 8
Color Components                : 3
Y Cb Cr Sub Sampling            : YCbCr4:2:0 (2 2)
Image Size                      : 3024x4032
Megapixels                      : 12.2
```
