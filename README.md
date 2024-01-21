Step 1: Terraform Code for AWS EKS Cluster
File Structure:
Workflow
 - eks.yml
 - aws_tf_plan.yml
 - aws_tf_apply.yml

Manifest files for Kubernetes
 eks
  - main.tf
  - outputs.tf
  - variables.tf

vpc (for configuring virtual private networking)
 - main.tf
 - outputs.tf
 - variables.tf


main.tf(this code will create the eks cluster)
variables.tf
provider.tf
