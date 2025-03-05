data "aws_ami" "os_image" {
    owners = [ "099720109477" ]
   most_recent = true

    filter {
     name = "state"
     values = [ "available" ]
    }
    filter {
      name = "name"
      values = [ "ubuntu/images/*" ]
    }
}

# This is output block to know the public IP of an insatnce once it is created.
output "ec2_public_ip" {
    
    value = aws_instance.myec2[*].public_ip

  
}




resource "aws_key_pair" "myec2key2025" {   
    key_name = "myec2-key"
    public_key = file("junooonkey.pub")
}
resource "aws_default_vpc" "default" {
  
}

resource "aws_security_group" "myzplus" {
  name = "k8s-securitygroup"
  vpc_id = aws_default_vpc.default.id  

  ingress {
    description = "inbound Rule for EC2"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Outbond Rule for ec2"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  ingress {
    description = "Inbount Rule for http"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
 

  ingress {
    description = "Inbound rule for https"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  
}

variable "ec2_instance_count" {
    description = "This is count of EC2 we are going to create"
  default = 2
}

resource "aws_instance" "myec2" {
    
    #ami = "ami-03fd334507439f4d1"
    count = var.ec2_instance_count
    ami = data.aws_ami.os_image.id
    instance_type = "t2.micro"
    key_name = aws_key_pair.myec2key2025.key_name
    security_groups = [aws_security_group.myzplus.name]
    
    root_block_device {
      volume_size = 10
      volume_type = "gp3"
    }
    tags = {
  
        name="myTerraformEc2"
    }
  
}