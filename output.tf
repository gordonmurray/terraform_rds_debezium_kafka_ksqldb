output "rds_host" {
  value = aws_db_instance.default.address
}

output "rds_username" {
  value = aws_db_instance.default.username
}

output "rds_password" {
  value     = random_password.password.result
  sensitive = true
}

output "debezium_instance_ip" {
  value = aws_instance.debezium_ksqldb.public_ip
}

resource "local_file" "output_file" {
  filename = "roles/debezium/vars/main.yml"
  content  = <<EOF
# This file is auto generated by Terraform
rds_host: ${aws_db_instance.default.address}
rds_username: ${aws_db_instance.default.username}
rds_password: ${random_password.password.result}
brokers: ${aws_msk_cluster.kafka.bootstrap_brokers}
EOF
}

output "msk_bootstrap_brokers" {
  value       = aws_msk_cluster.kafka.bootstrap_brokers
  description = "MSK Cluster Bootstrap Brokers"
}

