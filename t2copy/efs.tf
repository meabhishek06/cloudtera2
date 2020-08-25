resource "aws_efs_file_system" "EFS_CREATE" {
  creation_token = "EFS_CREATE"

  tags = {
    Name = "EFS_CREATE"
  }
depends_on = [
aws_instance.web
]
}

resource "aws_efs_mount_target" "EFS_MOUNT_TARGET" {
  file_system_id = "${aws_efs_file_system.EFS_CREATE.id}"
  subnet_id      = "${aws_instance.web.subnet_id}"
 security_groups = ["${aws_security_group.allow_tcp.id}"]


depends_on = [
aws_efs_file_system.EFS_CREATE,aws_instance.web,aws_security_group.allow_tcp
]
}


#To mount EFS volume

resource "null_resource" "nullremote" {
 depends_on = [
  aws_efs_mount_target.EFS_MOUNT_TARGET,
 ]
 
 connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("linuxlw.pem")
    host     = aws_instance.web.public_ip
  }

 provisioner "remote-exec" {
  inline = [
   "sudo mount -t nfs4 ${aws_efs_mount_target.EFS_MOUNT_TARGET.ip_address}:/ /var/www/html/",
   "sudo rm -rf /var/www/html/*",
   "sudo git clone https://github.com/meabhishek06/cloudtask2.git /var/www/html/"
  ]
 }
}