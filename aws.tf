resource "aws_instance" "myFirstTFinstance" {
    ami = "ami-03fd334507439f4d1"
    instance_type = "t2.micro"
    key_name = "Junoon2025IRE"

}