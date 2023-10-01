resource "aws_security_group_rule" "redis_0" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.redis.id
  description       = "Allow all out"
}

resource "aws_security_group_rule" "redis_1" {
  type                     = "ingress"
  from_port                = 6379
  to_port                  = 6379
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.debezium.id
  security_group_id        = aws_security_group.redis.id
  description              = "Allow ingress to redis"
}
