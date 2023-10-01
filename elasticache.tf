resource "aws_elasticache_subnet_group" "redis_subnet_group" {
  name = "redis-subnet-group"
  subnet_ids = [
    aws_subnet.subnet-1a.id,
    aws_subnet.subnet-1b.id,
    aws_subnet.subnet-1c.id,
  ]
  description = "Subnet for Redis"

  tags = {
    Name = var.default_tag
  }
}


resource "aws_elasticache_replication_group" "default" {
  preferred_cache_cluster_azs = []
  replication_group_id        = "redis-cache"
  description                 = "A redis cache"
  node_type                   = "cache.t4g.micro"
  num_cache_clusters          = 1
  parameter_group_name        = aws_elasticache_parameter_group.default.id
  port                        = 6379
  subnet_group_name           = aws_elasticache_subnet_group.redis_subnet_group.name
  auto_minor_version_upgrade  = true
  at_rest_encryption_enabled  = true
  transit_encryption_enabled  = false
  engine                      = "redis"
  engine_version              = "7.0"
  security_group_ids          = [aws_security_group.redis.id]
  snapshot_retention_limit    = 1
  multi_az_enabled            = false # on instances with 1 node multiaz won't work
  automatic_failover_enabled  = false # on instances with 1 node failover won't work

  tags = {
    Name = var.default_tag
  }

}

resource "aws_elasticache_parameter_group" "default" {
  name        = "redis-parameter-group"
  family      = "redis7"
  description = "Redis parameter group"

  parameter {
    name  = "maxmemory-policy"
    value = "allkeys-lru"
  }

  parameter {
    name  = "reserved-memory-percent"
    value = "30"
  }

  tags = {
    Name = var.default_tag
  }

}
