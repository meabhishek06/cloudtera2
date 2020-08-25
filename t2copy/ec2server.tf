resource "aws_instance" "web" {
  ami           = "ami-0447a12f28fddb066"
  instance_type = "t2.micro"
  key_name = "terrkey"
  security_groups = [ "allow_tcp" ]
  depends_on = [
    null_resource.nulllocal5,
  ]
  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("C:/Users/arora/Desktop/linuxlw.pem")
    host     = aws_instance.web.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd  php git -y",
      "sudo systemctl restart httpd",
      "sudo systemctl enable httpd"
    ]
  }

  tags = {
    Name = "Webserver"
  }

}

/*
resource "aws_ebs_volume" "esb1" {
  availability_zone = aws_instance.web.availability_zone
  size              = 1
  depends_on = [
    aws_instance.web,
  ] 
tags = {
    Name = "WebserverEBS"
  }
}


resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.esb1.id}"
  instance_id = "${aws_instance.web.id}"
  force_detach = true
  depends_on = [
    aws_ebs_volume.esb1,
  ]
}
*/

output "myos_ip" {
  value = aws_instance.web.public_ip
}


resource "null_resource" "nulllocal2"  {
	provisioner "local-exec" {
	    command = "echo  ${aws_instance.web.public_ip} > publicip.txt"
  	}
}

/*

resource "null_resource" "nullremote3"  {

depends_on = [
    aws_volume_attachment.ebs_att,
  ]


  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("C:/Users/arora/Desktop/linuxlw.pem")
    host     = aws_instance.web.public_ip
  }

provisioner "remote-exec" {
    inline = [
      "sudo mkfs.ext4  /dev/xvdh",
      "sudo mount  /dev/xvdh  /var/www/html",
      "sudo rm -rf /var/www/html/*",
      "sudo git clone https://github.com/meabhishek06/cloudtera1.git /var/www/html/"
    ]
  }
}

*/

resource "null_resource" "nulllocal1"  {


depends_on = [
    null_resource.nullremote,
  ]

	provisioner "local-exec" {
	    command = "msedge  ${aws_instance.web.public_ip}"
  	}
}



resource "null_resource" "nulllocal4"  {
depends_on = [
    aws_cloudfront_distribution.s3_distribution,
  ]

	provisioner "local-exec" {
	    command = "echo http://${aws_cloudfront_distribution.s3_distribution.domain_name}/pic.jpg > domain.txt"
}
provisioner "local-exec" {
	    command = "notepad domain.txt"
}
}
resource "null_resource" "nulllocal5"  {
depends_on = [
    null_resource.nulllocal4,
  ]
provisioner "local-exec" {
	    command = "msedge  https://github.com/meabhishek06/cloudtask2/blob/master/index.html"
  	}
}
