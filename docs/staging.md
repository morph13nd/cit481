AWS Account with credits
Terraform
Docker
NGINX
EC2 Instance running Ubuntu 18.04
EC2 CPU?
RAM?
Storage 20GB
Firewall
  Allow SSH
  0.0.0.0/0

Create a custom VPC with 1 private and 1 public subnet
CIDR 10.0.0.0/16 for the VPC. 
Public Subnet is 10.0.1.0/24
Webserver with rocket chat service, mongoDB containers, and a instance for SSH to connect to the prometheus server.

Private Subnet 10.0.2.0/24
Hosts Prometheus

Attach launch_ssh_setup.sh script to the terraform
  Installs nginx
  Download and install docker
  Download and install docker compose
  create needed directories for docker log files
  Clone github repository for the remaining files
  Move docker compose YAML file to appropriate dir
  Replace the default NGINX configuration files with our updated files
  Execute docker compose to initilzie mongodb and rocketchat containers
  Process can take roughly around 5 to 10 minutes
  
  ### Support or Contact

Having trouble with Pages? Check out our [documentation](https://docs.github.com/categories/github-pages-basics/) or [contact support](https://support.github.com/contact) and we’ll help you sort it out.

```markdown
Syntax highlighted code block

# Header 1
## Header 2
### Header 3

- Bulleted
- List

1. Numbered
2. List

**Bold** and _Italic_ and `Code` text

[Link](url) and ![Image](src)
```

For more details see [GitHub Flavored Markdown](https://guides.github.com/features/mastering-markdown/).

