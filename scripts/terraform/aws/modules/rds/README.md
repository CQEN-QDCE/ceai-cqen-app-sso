<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_instance.rds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_subnet_group.db_sn_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_secretsmanager_secret.rds_secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.rds_secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [random_password.db_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [aws_kms_key.rds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/kms_key) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_rds_allocated_storage"></a> [aws\_rds\_allocated\_storage](#input\_aws\_rds\_allocated\_storage) | Le stockage assigné en gigabytes | `number` | n/a | yes |
| <a name="input_aws_rds_application"></a> [aws\_rds\_application](#input\_aws\_rds\_application) | Le nom de l'application. | `string` | n/a | yes |
| <a name="input_aws_rds_auto_minor_version_upgrade"></a> [aws\_rds\_auto\_minor\_version\_upgrade](#input\_aws\_rds\_auto\_minor\_version\_upgrade) | Indique que la mise à jour de versions plus récentes est permise. | `bool` | n/a | yes |
| <a name="input_aws_rds_backup_retention_period"></a> [aws\_rds\_backup\_retention\_period](#input\_aws\_rds\_backup\_retention\_period) | La période de rétention du backup en jours (entre 0 et 35). | `number` | n/a | yes |
| <a name="input_aws_rds_cloudwatch_logs"></a> [aws\_rds\_cloudwatch\_logs](#input\_aws\_rds\_cloudwatch\_logs) | Ensemble de type de logs pour exporter vers les logs CloudWatch. | `list(string)` | n/a | yes |
| <a name="input_aws_rds_database_name"></a> [aws\_rds\_database\_name](#input\_aws\_rds\_database\_name) | Le nom de la base de données à créer pour l'instance DB. | `string` | n/a | yes |
| <a name="input_aws_rds_database_subnet_ids"></a> [aws\_rds\_database\_subnet\_ids](#input\_aws\_rds\_database\_subnet\_ids) | La liste des IDs des subnetsA du VPC. | `list(string)` | n/a | yes |
| <a name="input_aws_rds_db_username"></a> [aws\_rds\_db\_username](#input\_aws\_rds\_db\_username) | Le nom de l'utilisateur de la base de données RDS | `string` | n/a | yes |
| <a name="input_aws_rds_engine"></a> [aws\_rds\_engine](#input\_aws\_rds\_engine) | Le moteur de base de données à utiliser. | `string` | n/a | yes |
| <a name="input_aws_rds_engine_version"></a> [aws\_rds\_engine\_version](#input\_aws\_rds\_engine\_version) | La version du moteur de base de données à utiliser. | `string` | n/a | yes |
| <a name="input_aws_rds_environment"></a> [aws\_rds\_environment](#input\_aws\_rds\_environment) | L'environnement de déploiement (dev, prod). Défaut = "dev". | `string` | `"dev"` | no |
| <a name="input_aws_rds_iam_database_authentication_enabled"></a> [aws\_rds\_iam\_database\_authentication\_enabled](#input\_aws\_rds\_iam\_database\_authentication\_enabled) | Indique si l'option d'authentification avec AWS Identity and Access Management (IAM) est activée. | `bool` | n/a | yes |
| <a name="input_aws_rds_instance_class"></a> [aws\_rds\_instance\_class](#input\_aws\_rds\_instance\_class) | Le type d'instance du RDS. | `string` | n/a | yes |
| <a name="input_aws_rds_monitoring_interval"></a> [aws\_rds\_monitoring\_interval](#input\_aws\_rds\_monitoring\_interval) | L'intervalle, en seconds, entre les moments de la collecte de métriques (Enhanced Monitoring) pour l'instance de base de données. | `number` | n/a | yes |
| <a name="input_aws_rds_multi_az"></a> [aws\_rds\_multi\_az](#input\_aws\_rds\_multi\_az) | Indique si l'instance RDS est multi-AZ. | `string` | n/a | yes |
| <a name="input_aws_rds_performance_insights_enabled"></a> [aws\_rds\_performance\_insights\_enabled](#input\_aws\_rds\_performance\_insights\_enabled) | Indique si Performance Insights est activé. | `bool` | n/a | yes |
| <a name="input_aws_rds_port"></a> [aws\_rds\_port](#input\_aws\_rds\_port) | Le port de connection à la base de données. | `number` | n/a | yes |
| <a name="input_aws_rds_publicly_accessible"></a> [aws\_rds\_publicly\_accessible](#input\_aws\_rds\_publicly\_accessible) | Indique si l'instance est accessible publiquement. | `bool` | n/a | yes |
| <a name="input_aws_rds_skip_final_snapshot"></a> [aws\_rds\_skip\_final\_snapshot](#input\_aws\_rds\_skip\_final\_snapshot) | Indique si le snapshot final est sauté | `bool` | n/a | yes |
| <a name="input_aws_rds_storage_encrypted"></a> [aws\_rds\_storage\_encrypted](#input\_aws\_rds\_storage\_encrypted) | Indique si le stockage est crypté | `bool` | n/a | yes |
| <a name="input_aws_rds_storage_type"></a> [aws\_rds\_storage\_type](#input\_aws\_rds\_storage\_type) | Un de "standard" (magnetic), "gp2" (general purpose SSD), ou "io1" (provisioned IOPS SSD). Par défaut c'est "io1" si iops est specifié, "gp2" si non. | `string` | n/a | yes |
| <a name="input_aws_rds_vpc_security_group_ids"></a> [aws\_rds\_vpc\_security\_group\_ids](#input\_aws\_rds\_vpc\_security\_group\_ids) | Liste d'IDs des groups de sécurité du VPC qui seront associés. | `list(string)` | n/a | yes |
| <a name="input_identifier"></a> [identifier](#input\_identifier) | Nom unique pour identifier les ressources AWS | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db_name"></a> [db\_name](#output\_db\_name) | Le nom de la base de données RDS. |
| <a name="output_db_password_secret"></a> [db\_password\_secret](#output\_db\_password\_secret) | Référence vers le secret contenant le mot de passe administrateur de la base de donnée MySQL |
| <a name="output_db_user_secret"></a> [db\_user\_secret](#output\_db\_user\_secret) | Référence vers le secret contenant le nom d'usager administrateur de la base de donnée MySQL |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | L'adresse IP de l'instance principale du serveur. |
| <a name="output_rds_arn"></a> [rds\_arn](#output\_rds\_arn) | L'ARN du cluster Postgres dans RDS. |
| <a name="output_rds_db_deploy"></a> [rds\_db\_deploy](#output\_rds\_db\_deploy) | La ressource aws pour voir si l'instance mysql est bien déployée |
| <a name="output_rds_db_pass"></a> [rds\_db\_pass](#output\_rds\_db\_pass) | Le mot de passe administrateur de la base de donnée MySQL |
| <a name="output_rds_id"></a> [rds\_id](#output\_rds\_id) | Id du cluster Postgres dans RDS |
<!-- END_TF_DOCS -->