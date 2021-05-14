### About

This document is for all of the staging that is performed beforehand to build the needed infrastructure, and attempt to speed up and automate the deployment of our infrastructure.

### Technological Requirements

1. An AWS Educate Account
2. AWS Account with credits
3. Terraform
4. Docker
5. NGINX
6. EC2 Instance running Ubuntu 18.04
7. EC2 CPU and RAM
8. Firewall

### AWS Educate

AWS Educate aims to train the next generation of cloud computing professionals. Within our class, we are encouraged to us this means of accomplishing our project or purchasing more resources. Due to a lack of skilled AWS employees, many employers in the future will turn to AWS to find skilled employees. Therefore, AWS created AWS Educate to teach AWS and develop skills for high school and college students. Students can get free tuition, sometimes can use certification credentials, the school system to earn resources, and students can develop projects to improve their AWS skills.

### AWS Security Groups

  You need to configure your AWS security groups. The cloud environment by controlling how traffic is allowed on your EC2 computers. You can use security groups to ensure that all instance-level traffic is only going through your designated ports and protocols. When you start an instance, you need to assign it to a specific security group on Amazon EC2. You can add rules to each security group that allow traffic to or from specific services, including associated instances. Like whitelists, security group rules are always allowed. You cannot create rules that deny access. For example, traffic can come from an Elastic Load Balancer (ELB) to a subnet with web servers. The AWS security group can include this ELB as the only permitted source. Security groups are stateful. So when an incoming request is approved, the outgoing request is also approved. 
  
  For each EC2 instance, you can specify up to five security groups for each network interface.  In addition, different security group sets can be assigned to each instance in the VPC subnet. When traffic can reach the instance, Amazon EC2 evaluates all the rules of all assigned security groups. After adding or changing rules, they will be applied automatically.All instances assigned to the security group. With tools such as CloudGuard, you can visualize the cloud security status at the infrastructure level (VPC, security group, EC2 and RDS instances, Amazon S3 bucket, elastic load balancer, etc. ) and identify configuration deviations interactively. Security group and network ACL. Network Access Control List (NACL) is another method of controlling incoming and outgoing traffic in one or more subnets.Unlike AWS security groups, NACL is stateless, so incoming and outgoing rules are evaluated. The network ACL can be configured as an extra layer of security for the VPC.
  
You can feel free to create several security groups. We have one for Rocket Chat, Grafana, Prometheus and our SSH Bastion hosts.

### VPCs

Create a custom VPC with 1 private and 1 public subnet. The CIDR for the VPC is 10.0.0.0/16. The public subnet is 10.0.1.0/24. Webserver with rocket chat service, mongoDB containers, and a instance for SSH to connect to the prometheus server. The private subnet 10.0.2.0/24 will hosts Prometheus.

### The Launch Script

For our scripting portion, we used the bash shell. Computer programs that can be run in the UNIX Shell command line interpreter to process files, run programs and print text are called Shell scripts. Most system management tasks are performed using shell scripts, such as backing up disks and parsing system logs, and are also used as setup scripts for complex programming.  It has a series of commands followed by a shell program containing some parameters that instruct the shell program to perform certain actions. Single command follows commandAnd perform operations, which is why it is called Shell Script. This is useful for repetitive system administration tasks. Bash is the abbreviation of Bourne-Again Shell. The UNIX Shell executes programs in a command line interpreter so that computer programs can use different dialects of the language. The language contains many commands in the text, and these commands are a mixture of different commands.The scripting language is about editing files, running programs and printing text. These scripts are mainly used for administrative tasks on the system. Bash has a calling function, and the appearance can be customized in the script. In addition, they help to install complex programs. This includes user profile copnfigurations like .bashrc.

Just like a command line shell with additional functions, bash is a special part of IEEEPOSIX. The bash shell is widely used in various operating systems, and almost all GNU/Linux systems use standard command line interpreters.It also includes cshell and kshell functions. 
#### Shell: Shell is a macro processor that can be used to execute interactive or non-interactive commands. It is completely based on a graphical user interface, so users can interact with the basic operating system. Allows us to execute commands automatically instead of manually executing code. It mainly reduces manpower and costcarried out. 
#### Kernel: This is the kernel of the operating system, used to communicate with the hardware and the shell for information exchange. 
#### Application: This is a graphical user interface application used by the end user.

These are the steps found within the bash script:

-  Attach launch_ssh_setup.sh script to the terraform.
-  Installs nginx
-  Download and install docker
-  Download and install docker compose
-  create needed directories for docker log files
-  Clone github repository for the remaining files
-  Move docker compose YAML file to appropriate dir
-  Replace the default NGINX configuration files with our updated files
-  Execute docker compose to initilzie mongodb and rocketchat containers
-  Process can take roughly around 5 to 10 minutes
  
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

