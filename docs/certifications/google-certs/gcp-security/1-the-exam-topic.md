---
reviewdate: '2026-12-20'
title: GCP Security, exam topics
---

#### Section 1. Configuring access within a cloud solution environment

##### 1.1 Configuring Cloud Identity. Considerations include

a. Managing Cloud Identity

b. Configuring Google Cloud Directory Sync

c. Managing super administrator account

d. Automating user lifecycle management process

e. Administering user accounts and groups programmatically

##### 1.2 Managing service accounts. Considerations include

a. Protecting and auditing service accounts and keys

b. Automating the rotation of user-managed service account keys

c. Identifying scenarios requiring service accounts

d. Creating, authorizing, and securing service accounts

e. Securely managing API access management

f. Managing and creating short-lived credentials

##### 1.3 Managing authentication. Considerations include

a. Creating a password policy for user accounts

b. Establishing Security Assertion Markup Language (SAML)

c. Configuring and enforcing two-factor authentication

##### 1.4 Managing and implementing authorization controls. Considerations include

a. Managing privileged roles and separation of duties

b. Managing IAM permissions with basic, predefined, and custom roles

c. Granting permissions to different types of identities

d. Understanding difference between Cloud Storage IAM and ACLs

e. Designing identity roles at the organization, folder, project, and resource level

f. Configuring Access Context Manager

##### 1.5 Defining resource hierarchy. Considerations include

a. Creating and managing organizations

b. Designing resource policies for organizations, folders, projects, and resources

c. Managing organization constraints

d. Using resource hierarchy for access control and permissions inheritance

e. Designing and managing trust and security boundaries within Google Cloud projects

#### Section 2. Configuring network security

##### 2.1 Designing network security. Considerations include

a. Configuring network perimeter controls (firewall rules; Identity-Aware Proxy (IAP))

b. Configuring load balancing (global, network, HTTP(S), SSL proxy, and TCP proxy load balancers)

c. Identifying Domain Name System Security Extensions (DNSSEC)

d. Identifying differences between private versus public addressing

e. Configuring web application firewall (Google Cloud Armor)

f. Configuring Cloud DNS

##### 2.2 Configuring network segmentation. Considerations include

a. Configuring security properties of a VPC network, VPC peering, Shared VPC, and firewall rules

b. Configuring network isolation and data encapsulation for N tier application design

c. Configuring app-to-app security policy

##### 2.3 Establishing private connectivity. Considerations include

a. Designing and configuring private RFC1918 connectivity between VPC networks and Google Cloud projects (Shared VPC, VPC peering)

b. Designing and configuring private RFC1918 connectivity between data centers and VPC network (IPsec and Cloud Interconnect)

c. Establishing private connectivity between VPC and Google APIs (Private Google Access, Private Google Access for on-premises hosts, Private Service Connect)

d. Configuring Cloud NAT

#### Section 3. Ensuring data protection

##### 3.1 Protecting sensitive data. Considerations include

a. Inspecting and redacting personally identifiable information (PII)

b. Configuring pseudonymization

c. Configuring format-preserving substitution

d. Restricting access to BigQuery datasets

e. Configuring VPC Service Controls

f. Securing secrets with Secret Manager

g. Protecting and managing compute instance metadata

##### 3.2 Managing encryption at rest. Considerations include

a. Understanding use cases for Google default encryption, customer-managed encryption keys (CMEK), customer-supplied encryption keys (CSEK), Cloud External Key Manager (EKM), and Cloud HSM

b. Creating and managing encryption keys for CMEK, CSEK, and EKM

c. Applying Google's encryption approach to use cases

d. Configuring object lifecycle policies for Cloud Storage

e. Enabling confidential computing

#### Section 4. Managing operations in a cloud solution environment

##### 4.1 Building and deploying secure infrastructure and applications. Considerations include

a. Automating security scanning for Common Vulnerabilities and Exposures (CVEs) through a CI/CD pipeline

b. Automating virtual machine image creation, hardening, and maintenance

c. Automating container image creation, verification, hardening, maintenance, and patch management

##### 4.2 Configuring logging, monitoring, and detection. Considerations include

a. Configuring and analyzing network logs (firewall rule logs, VPC flow logs, packet mirroring)

b. Designing an effective logging strategy

c. Logging, monitoring, responding to, and remediating security incidents

d. Exporting logs to external security systems

e. Configuring and analyzing Google Cloud audit logs and data access logs

f. Configuring log exports (log sinks, aggregated sinks, logs router)

g. Configuring and monitoring Security Command Center (Security Health Analytics, Event Threat Detection, Container Threat Detection, Web Security Scanner)

#### Section 5. Ensuring compliance

##### 5.1 Determining regulatory requirements for the cloud. Considerations include

a. Determining concerns relative to compute, data, and network

b. Evaluating security shared responsibility model

c. Configuring security controls within cloud environments

d. Limiting compute and data for regulatory compliance

e. Determining the Google Cloud environment in scope for regulatory compliance
