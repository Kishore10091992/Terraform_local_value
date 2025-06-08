output "Instance_id_0" {
 description = "Ec2 instance id_0"
 value = aws_instance.local_value_ec2[0].id
}

output "Instance_id_1" {
 description = "Ec2 instance id_1"
 value = aws_instance.local_value_ec2[1].id
}