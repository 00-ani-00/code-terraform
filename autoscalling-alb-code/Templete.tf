resource "aws_launch_template" "LT-1" {
  name                   = "my-LT-1"
  image_id               = "ami-02cad064a29d4550c"
  instance_type          = "t2.micro"
  key_name               = "ASG-key"
  vpc_security_group_ids = [aws_security_group.sg.id]
  user_data = base64encode(
    <<-EOF
#!/bin/bash
yum update all -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd
echo "welcome from home page $(hostname -f)" >/var/www/html/index.html
EOF
  )

  tags = {
    Name = "project1"

  }

}

resource "aws_launch_template" "LT-2" {
  name                   = "my-LT-2"
  image_id               = "ami-02cad064a29d4550c"
  instance_type          = "t2.micro"
  key_name               = "ASG-key"
  vpc_security_group_ids = [aws_security_group.sg.id]
  user_data = base64encode(
    <<-EOF
#!/bin/bash
yum update all -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd
mkdir /var/www/html/mobile
echo "welcome from mobile page $(hostname -f)" >/var/www/html/mobile/index.html
EOF
  )

  tags = {
    Name = "project2"

  }

}

resource "aws_launch_template" "LT-3" {
  name                   = "my-LT-3"
  image_id               = "ami-02cad064a29d4550c"
  instance_type          = "t2.micro"
  key_name               = "ASG-key"
  vpc_security_group_ids = [aws_security_group.sg.id]
  user_data = base64encode(
    <<-EOF
#!/bin/bash
yum update all -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd
mkdir /var/www/html/laptop
echo "welcome from laptop page $(hostname -f)" >/var/www/html/laptop/index.html
EOF
  )

  tags = {
    Name = "project3"

  }

}

