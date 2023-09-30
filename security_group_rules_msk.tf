resource "aws_security_group_rule" "msk_0" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.kafka.id
  description       = "Allow all out"
}

resource "aws_security_group_rule" "msk_1" {
  type                     = "ingress"
  from_port                = 9092
  to_port                  = 9092
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.debezium.id
  security_group_id        = aws_security_group.kafka.id
  description              = "Allow ingress to MSK"
}
