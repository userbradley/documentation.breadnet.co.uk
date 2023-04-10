---
title: Creating Minio users and assigning permissions
reviewdate: '2022-01-01'
---



## Connect to the minio server

```
mc config host add myminio https://s3.breadnet.co.uk:9000 BWFEUE9RZUOQWAFP1DCQ LYLBt+qW8TnqlD7Kq1y29IFLDUBL5Qvx+JMimcR7
```

Create the policy, using the below as a guide. Save it to reflect what it does

Create the policy on minio

```
mc admin policy add myminio <policy name> <policy file>.json
```

Create a user to assign it to

```
mc admin user add myminio <username> <password>
```

## Assign the policy to the user

```
mc admin policy set myminio <policyname> user=<username>
```

## Policy to allow access to a full bucket

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": [
          "*"
        ]
      },
      "Action": [
        "s3:GetBucketLocation",
        "s3:ListBucket",
        "s3:ListBucketMultipartUploads"
      ],
      "Resource": [
        "arn:aws:s3:::testbucket-1"
      ]
    },
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": [
          "*"
        ]
      },
      "Action": [
        "s3:AbortMultipartUpload",
        "s3:DeleteObject",
        "s3:GetObject",
        "s3:ListMultipartUploadParts",
        "s3:PutObject"
      ],
      "Resource": [
        "arn:aws:s3:::testbucket-1/*"
      ]
    }
  ]
}
```


## Policy to allow access to a folder in a bucket

```json
{
 "Version":"2012-10-17",
 "Statement": [
   {
     "Sid": "AllowStatement1",
     "Action": ["s3:ListAllMyBuckets", "s3:GetBucketLocation"],
     "Effect": "Allow",
     "Resource": ["arn:aws:s3:::*"]
   },
  {
     "Sid": "AllowStatement2A",
     "Action": ["s3:ListBucket"],
     "Effect": "Allow",
     "Resource": ["arn:aws:s3:::serverbackup"],
     "Condition":{"StringEquals":{"s3:prefix":["","dbserver"]}}
    },
  {
     "Sid": "AllowStatement3",
     "Action": ["s3:ListBucket"],
     "Effect": "Allow",
     "Resource": ["arn:aws:s3:::serverbackup"],
     "Condition":{"StringLike":{"s3:prefix":["dbserver/*"]}}
    },    
   {
     "Sid": "AllowStatement4A",
     "Effect": "Allow",
      "Action": [
        "s3:AbortMultipartUpload",
        "s3:DeleteObject",
        "s3:GetObject",
        "s3:ListMultipartUploadParts",
        "s3:PutObject"
      ],
     "Resource": ["arn:aws:s3:::serverbackup/dbserver/*"]
   }
 ]
}
```