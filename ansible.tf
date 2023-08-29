resource "ansible_host" "host" {
  name   = aws_instance.debezium_ksqldb.public_ip
  groups = ["debezium"]
}

resource "ansible_playbook" "playbook" {
  playbook   = "/home/gordon/terraform/terraform_rds_debezium_kafka_ksqldb/playbook.yml"
  name       = aws_instance.debezium_ksqldb.public_ip
  replayable = true

  extra_vars = {
    example_variable             = "Some variable"
    ansible_hostname             = aws_instance.debezium_ksqldb.public_ip
    ansible_user                 = "ubuntu"
    ansible_ssh_private_key_file = "~/.ssh/id_rsa"
    ansible_python_interpreter   = "/usr/bin/python3"
  }
}
