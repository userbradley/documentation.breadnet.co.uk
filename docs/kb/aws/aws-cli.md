---
title: AWS CLI
---

# AWS CLI

Locate resources based on IP


```shell
aws ec2 describe-network-interfaces --filters Name=addresses.private-ip-address,Values=<ip>
```

Find an EC2 instance from its security group

```shell
aws ec2 describe-network-interfaces --filters Name=group-id,Values=<group-id> --region <region> --output json
```

