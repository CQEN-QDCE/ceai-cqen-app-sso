<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_api_gateway"></a> [api\_gateway](#module\_api\_gateway) | ./modules/api-gateway | n/a |
| <a name="module_backup"></a> [backup](#module\_backup) | ./.terraform/modules/ceai_lib/aws/sea-backup | n/a |
| <a name="module_ceai_lib"></a> [ceai\_lib](#module\_ceai\_lib) | github.com/CQEN-QDCE/ceai-cqen-terraform-lib | dev |
| <a name="module_ecr"></a> [ecr](#module\_ecr) | ./modules/ecr | n/a |
| <a name="module_ecs_cluster"></a> [ecs\_cluster](#module\_ecs\_cluster) | ./.terraform/modules/ceai_lib/aws/sea-ecs-cluster | n/a |
| <a name="module_rds"></a> [rds](#module\_rds) | ./modules/rds | n/a |
| <a name="module_sea_cicd_codebuild"></a> [sea\_cicd\_codebuild](#module\_sea\_cicd\_codebuild) | ./.terraform/modules/ceai_lib/aws/sea-cicd-codebuild | n/a |
| <a name="module_sea_cicd_pipeline"></a> [sea\_cicd\_pipeline](#module\_sea\_cicd\_pipeline) | ./modules/codepipeline | n/a |
| <a name="module_sea_ecs_service"></a> [sea\_ecs\_service](#module\_sea\_ecs\_service) | ./.terraform/modules/ceai_lib/aws/sea-ecs-fargate-service | n/a |
| <a name="module_sea_network"></a> [sea\_network](#module\_sea\_network) | ./.terraform/modules/ceai_lib/aws/sea-network | n/a |
| <a name="module_sm"></a> [sm](#module\_sm) | ./modules/sm | n/a |

## Resources

| Name | Type |
|------|------|
| [template_file.container_task_def_tpl](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_buildspec_path"></a> [app\_buildspec\_path](#input\_app\_buildspec\_path) | Path du fichier buildspec de l'application dans le repo GitHub. | `string` | n/a | yes |
| <a name="input_app_hostname"></a> [app\_hostname](#input\_app\_hostname) | Nom du host de l'application. | `string` | n/a | yes |
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | Nom de l'application. | `string` | n/a | yes |
| <a name="input_app_path"></a> [app\_path](#input\_app\_path) | Path de l'application dans le repo GitHub. | `string` | n/a | yes |
| <a name="input_app_route53_zone_id"></a> [app\_route53\_zone\_id](#input\_app\_route53\_zone\_id) | ID de la zone hebergé de la Route53. | `string` | n/a | yes |
| <a name="input_aws_profile"></a> [aws\_profile](#input\_aws\_profile) | Nom du profil de connexion SSO dans le fichier .aws/config du poste qui exécute le déploiement | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | a specific AWS region | `string` | n/a | yes |
| <a name="input_backup_alarms_email"></a> [backup\_alarms\_email](#input\_backup\_alarms\_email) | The Delivers messages via SMTP. endpoint is an email address | `string` | n/a | yes |
| <a name="input_backup_rules"></a> [backup\_rules](#input\_backup\_rules) | The rule object that specifies a scheduled task that is used to back up a selection of resources | <pre>list(object({<br>      name                     = string<br>      schedule                 = string<br>      start_window             = number<br>      completion_window        = number<br>      delete_after             = number<br>      enable_continuous_backup = bool<br>    }))</pre> | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Nom de l'environnement du sytème déployé. | `string` | n/a | yes |
| <a name="input_github_repo_branch"></a> [github\_repo\_branch](#input\_github\_repo\_branch) | Branch du repo GitHub de l'application. | `string` | n/a | yes |
| <a name="input_github_repo_url"></a> [github\_repo\_url](#input\_github\_repo\_url) | URL du repo GitHub de l'application. | `string` | n/a | yes |
| <a name="input_scheme"></a> [scheme](#input\_scheme) | Scheme pour l'URL de l'application. [https, http] | `string` | n/a | yes |
| <a name="input_system"></a> [system](#input\_system) | Nom du système déployé. | `string` | `"Exemple"` | no |
| <a name="input_workload_account_type"></a> [workload\_account\_type](#input\_workload\_account\_type) | Type de compte de travail ASEA (Prefix du VPC partagé) [Sandbox, Dev, Prod] | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->