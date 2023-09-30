resource "aws_security_group_rule" "debezium_0" {
  type              = "egress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["${var.my_ip_address}/32"]
  security_group_id = aws_security_group.debezium.id
  description       = "SSH egress"
}

resource "aws_security_group_rule" "debezium_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["${var.my_ip_address}/32"]
  security_group_id = aws_security_group.debezium.id
  description       = "SSH ingress"
}

resource "aws_security_group_rule" "debezium_ksqldb" {
  type              = "ingress"
  from_port         = 8088
  to_port           = 8088
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.debezium.id
  description       = "ksqldb ingress"
}

resource "aws_security_group_rule" "debezium_all" {
  type              = "ingress"
  from_port         = 1
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.debezium.id
  description       = "ksqldb ingress allowing all TCP ports"
}


resource "aws_security_group_rule" "all_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.debezium.id
  description       = "Allow all out"
}