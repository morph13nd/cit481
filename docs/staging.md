
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
  
  

