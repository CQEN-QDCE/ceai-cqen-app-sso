#-------------------------------------------------------------------------------
# Configure the Amazon Simple Email Service (Amazon SES) 
#-------------------------------------------------------------------------------
resource "aws_ses_domain_identity" "example" {
  domain = var.aws_ses_domain
}