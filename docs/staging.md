### About

This document is for all of the staging that is performed beforehand to build the needed infrastructure, and attempt to speed up and automate the deployment of our infrastructure. Our entire infrastructure is deployed through Terraform and scripts that are executed upon specific systems. 

### Network Diagram

![NetworkDiagram](https://i.imgur.com/niNgCkQ.png)

### Technological Requirements

1. An AWS Educate Account
2. AWS Security Groups
3. VPC Deployment
4. Terraform
5. Docker
6. NGINX
7. Prometheus
8. Grafana
9. EC2 Instance running Ubuntu 18.04


### AWS Educate

AWS Educate aims to train the next generation of cloud computing professionals. Within our class, we are encouraged to us this means of accomplishing our project or purchasing more resources. Due to a lack of skilled AWS employees, many employers in the future will turn to AWS to find skilled employees. Therefore, AWS created AWS Educate to teach AWS and develop skills for high school and college students. Students can get free tuition, sometimes can use certification credentials, the school system to earn resources, and students can develop projects to improve their AWS skills. We use our AWS educate account with terraform to setup all of our newtworking infrastructure and micro instances of EC2.

### AWS Security Groups

  You need to configure your AWS security groups. The cloud environment by controlling how traffic is allowed on your EC2 computers. You can use security groups to ensure that all instance-level traffic is only going through your designated ports and protocols. When you start an instance, you need to assign it to a specific security group on Amazon EC2. You can add rules to each security group that allow traffic to or from specific services, including associated instances. Like whitelists, security group rules are always allowed. You cannot create rules that deny access. For example, traffic can come from an Elastic Load Balancer (ELB) to a subnet with web servers. The AWS security group can include this ELB as the only permitted source. Security groups are stateful. So when an incoming request is approved, the outgoing request is also approved. 
  
  For each EC2 instance, you can specify up to five security groups for each network interface.  In addition, different security group sets can be assigned to each instance in the VPC subnet. When traffic can reach the instance, Amazon EC2 evaluates all the rules of all assigned security groups. After adding or changing rules, they will be applied automatically.All instances assigned to the security group. With tools such as CloudGuard, you can visualize the cloud security status at the infrastructure level (VPC, security group, EC2 and RDS instances, Amazon S3 bucket, elastic load balancer, etc. ) and identify configuration deviations interactively. Security group and network ACL. Network Access Control List (NACL) is another method of controlling incoming and outgoing traffic in one or more subnets.Unlike AWS security groups, NACL is stateless, so incoming and outgoing rules are evaluated. The network ACL can be configured as an extra layer of security for the VPC.
  
You can feel free to create several security groups. We have one for Rocket Chat, Grafana, Prometheus and our SSH Bastion hosts.

### VPCs

Virtual Private Cloud (VPC) is a private cloud computing environment hosted in a public cloud. Essentially, VPC deploys a logically isolated part of the public cloud to create a virtual private environment. As in all cloud environments, VPC resources can be provided on demand to scale them as needed and are easy to configure.
Create a custom VPC with 1 private and 1 public subnet. The CIDR for the VPC is 10.0.0.0/16. The public subnet is 10.0.1.0/24. Webserver with rocket chat service, mongoDB containers, and a instance for SSH to connect to the prometheus server. The private subnet 10.0.2.0/24 will hosts Prometheus.

### Terraform

Terraform is an open source infrastructure coding tool created by HashiCorp. Terraform's declarative coding tools allow developers to use a high-level configuration language called HashiCorp Configuration Language (HCL) to describe the cloud or local infrastructure required for the final state of the application. Then, he creates a plan to achieve the final state and executes the infrastructure deployment plan. Because Terraform uses a simple syntax, it can deploy the infrastructure to multiple local and cloud data centers, and redeploy the infrastructure in response.In terms of configuration changes, it is currently one of the most popular infrastructure automation tools. If your company plans to implement a hybrid or multi-cloud environment, you may need or need to understand Terraform. Help you first understand the benefits of Infrastructure as Code (IaC). 

With IAC, developers can code the infrastructure in an automated, accelerated, and repeatable way. It is a key component of agile and DevOps practices such as version control and continuous integration. The main reasons developers use Terraform as code on other infrastructure tools are as follows:Open source: Terraform is supported by many contributors who have created plugins for the platform. No matter which cloud provider you use, you can easily find plugins, extensions, and professional support. This also means that Terraform is developing rapidly and is always adding new advantages and improvements. With platform independence, this means you can use them with any cloud provider. 

Most other IaC tools can be used with a single cloud provider to Middleware upgrade or new storage server. The danger of variable infrastructure is configuration drift: as changes accumulate, the actual deployment of various servers or other infrastructure elements will further deviate from the original configuration, making it difficult to diagnose and fix errors or performance issues. Immutable infrastructure, which means that whenever the environment changes, the new configuration will be replaced with a new configuration that takes this change into account, and the infrastructure will be replaced. In addition, you can save previous configurations as a version to roll back them if necessary or needed.

### Docker

Docker is an open source project to automate the delivery of applications such as portable and self-sufficient containers that can be run in the cloud or on-premise. Docker runs on Windows hosts only, and Linux images can run on Linux hosts and Windows hosts (previously using a Linux Hyper-V VM), where host means a server or a VM. Developers can use development environments on Windows, Linux ormacOS On the development computer, the developer runs a Docker host on which the Docker images are deployed, including the application and its dependencies.  Developers working on Linux or macOS use a Linux-based Docker host that can only create images for Linux containers. (Developers working on macOS can edit code or run DockerCLI on macOS. However, at the time of this writing, containers don't run directly on macOS.) Developers working on Windows can create images for Linux or Windows containers. Docker provides Docker Community Edition (CE) for Windows or MacOS to host containers in development environments and to provide additional development tools. We use docker for all of our services that are being hosted. 

### NGINX Web Server

Nginx, pronounced "engine x", is a free, open source, high-performance HTTP server and open source reverse proxy that can handle the load on some of the largest websites on the Internet.  It can be used as a standalone web server or Apache reverse proxy. And other web servers. If you are a developer or system administrator, you may use Nginx on a regular basis. When using the Nginx web server, starting, stopping, and restarting/restarting are the most common tasks. This is where we are hosting our application for rocket chat. 

### Prometheus

The software stores all data in a time series database, and provides a multi-dimensional data model and a powerful query language to generate controlled resource reports.  Extract metrics from HTTP endpoints. Since Prometheus shares data about itself in the same way, it can also grab and control its own state. Although a Prometheus server that only collects data about itself is not very useful, this is a good example of getting started. We used this in the YAML file. Please see the launch script to setup Prometheus on the T2 Micro instance.

### Grafana

Grafana is an open source analysis and visualization software. You can query, view, alert and investigate metrics, no matter where they are stored. In short, it provides you with tools to convert time series database (TSDB) data into beautiful graphs and visualizations. We connected Grafana to the appropriate server so we can generate our visualizations from Prometheus's Node Export application installed on the server we would like to monitor on our remote server 10.0.0.5.

### The Rocket Chat Script

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

### The Prometheus Launch Script

Prometheus is an open source system monitoring and warning toolkit originally based on SoundCloud. Since its establishment in 2012, many companies and organizations have adopted Prometheus, and the project has a very active community of developers and users. Prometheus obtains metrics from tool operations directly or through an intermediate staging gateway for short-term operations. Store all locally collected samples and enforce rules on this data to add and record new time series in existing data. Or generate an alert. Grafana or other API users can be used to visualize the collected data. This is why we implemented Grafana.

These are the steps found within the bash script:

-  Attach pro_launch.sh script to the terraform
-  Download the provided files such as the service file and the YAML file
-  Download and install prometheus
-  Stage prometheus service account
-  Stage prometheus 
-  Configure the service
-  Test the service


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

