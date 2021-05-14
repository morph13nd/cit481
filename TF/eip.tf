resource "aws_eip_association" "rocketchat-eip" {
  instance_id = aws_instance.rocket-chat-instance.id
  allocation_id = "eipalloc-099aa273162640dc3"
}

resource "aws_eip_association" "ssh-bastion-eip" {
  instance_id = aws_instance.ssh-bastion-instance.id
  allocation_id = "eipalloc-066d0665b066a13fe"
}

resource "aws_eip_association" "grafana-eip" {
  instance_id = aws_instance.grafana-instance.id
  allocation_id = "eipalloc-0fb3944d1113c0007"  
}
