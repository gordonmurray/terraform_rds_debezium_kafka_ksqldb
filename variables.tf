variable "aws_region" {
  type    = string
  default = "eu-west-1"
}

variable "default_tag" {
  type    = string
  default = "terraform_rds_debezium_kafka_ksqldb"
}

variable "my_ip_address" {
  type = string
}

variable "database_name" {
  type    = string
  default = "my-database"
}

variable "warpstream_broker" {
  type    = string
  default = "localhost:9092"
}