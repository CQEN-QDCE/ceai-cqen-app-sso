#-------------------------------------------------------------------------------
# Configure the Amazon Relational Database Service (Amazon SES) variables
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
# Domain identity
variable "aws_ses_domain" {
    type = string
    description = "Le domaine qui sera assigné au SES."
    sensitive = false
}