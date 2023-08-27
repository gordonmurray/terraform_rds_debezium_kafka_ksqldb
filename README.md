# terraform_rds_debezium_kafka_ksqldb
CDC with Debezium, WarpStream and ksqlDB



# Cost estimate

```
Project: gordonmurray/terraform_rds_debezium_kafka_ksqldb

 Name                                                             Monthly Qty  Unit                    Monthly Cost

 aws_db_instance.default
 ├─ Database instance (on-demand, Single-AZ, db.t4g.micro)                730  hours                         $12.41
 ├─ Storage (general purpose SSD, gp2)                                     20  GB                             $2.54
 └─ Additional backup storage                               Monthly cost depends on usage: $0.095 per GB

 aws_instance.debezium
 ├─ Instance usage (Linux/UNIX, on-demand, t4g.small)                     730  hours                         $13.43
 └─ root_block_device
    └─ Storage (general purpose SSD, gp2)                                  10  GB                             $1.10

 aws_kms_key.secrets_manager
 ├─ Customer master key                                                     1  months                         $1.00
 ├─ Requests                                                Monthly cost depends on usage: $0.03 per 10k requests
 ├─ ECC GenerateDataKeyPair requests                        Monthly cost depends on usage: $0.10 per 10k requests
 └─ RSA GenerateDataKeyPair requests                        Monthly cost depends on usage: $0.10 per 10k requests

 aws_secretsmanager_secret.example
 ├─ Secret                                                                  1  months                         $0.40
 └─ API requests                                            Monthly cost depends on usage: $0.05 per 10k requests

 OVERALL TOTAL                                                                                               $30.88
──────────────────────────────────
26 cloud resources were detected:
∙ 4 were estimated, 3 of which include usage-based costs, see https://infracost.io/usage-file
∙ 22 were free:
  ∙ 5 x aws_security_group_rule
  ∙ 3 x aws_route_table_association
  ∙ 3 x aws_subnet
  ∙ 2 x aws_security_group
  ∙ 1 x aws_db_option_group
  ∙ 1 x aws_db_parameter_group
  ∙ 1 x aws_db_subnet_group
  ∙ 1 x aws_internet_gateway
  ∙ 1 x aws_key_pair
  ∙ 1 x aws_route
  ∙ 1 x aws_route_table
  ∙ 1 x aws_secretsmanager_secret_version
  ∙ 1 x aws_vpc
```