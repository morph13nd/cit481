### Technological Requirements

1. AWS Account with credits
2. Terraform
3. Docker
4. NGINX
5. EC2 Instance running Ubuntu 18.04
6. EC2 CPU and RAM
7. Firewall
  
### AWS Security Groups

  You need to configure your AWS security groups. The cloud environment by controlling how traffic is allowed on your EC2 computers. You can use security groups to ensure that all instance-level traffic is only going through your designated ports and protocols. When you start an instance, you need to assign it to a specific security group on Amazon EC2. You can add rules to each security group that allow traffic to or from specific services, including associated instances. Like whitelists, security group rules are always allowed. You cannot create rules that deny access. For example, traffic can come from an Elastic Load Balancer (ELB) to a subnet with web servers. The AWS security group can include this ELB as the only permitted source. Security groups are stateful. So when an incoming request is approved, the outgoing request is also approved. 
  
  For each EC2 instance, you can specify up to five security groups for each network interface.  In addition, different security group sets can be assigned to each instance in the VPC subnet. When traffic can reach the instance, Amazon EC2 evaluates all the rules of all assigned security groups. After adding or changing rules, they will be applied automatically.All instances assigned to the security group. With tools such as CloudGuard, you can visualize the cloud security status at the infrastructure level (VPC, security group, EC2 and RDS instances, Amazon S3 bucket, elastic load balancer, etc. ) and identify configuration deviations interactively. Security group and network ACL. Network Access Control List (NACL) is another method of controlling incoming and outgoing traffic in one or more subnets.Unlike AWS security groups, NACL is stateless, so incoming and outgoing rules are evaluated. The network ACL can be configured as an extra layer of security for the VPC.
  
You can feel free to create several security groups. We have one for Rocket Chat, Grafana, Prometheus and our SSH Bastion hosts.

### VPCs

Create a custom VPC with 1 private and 1 public subnet. The CIDR for the VPC is 10.0.0.0/16. The public subnet is 10.0.1.0/24. Webserver with rocket chat service, mongoDB containers, and a instance for SSH to connect to the prometheus server. The private subnet 10.0.2.0/24 will hosts Prometheus.

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

