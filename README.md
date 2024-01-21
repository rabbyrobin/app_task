Step 1: Terraform Code for AWS EKS Cluster
File Structure:
Workflow
 - eks.yml
 - aws_tf_plan.yml
 - aws_tf_apply.yml

Manifest files for Kubernetes
 eks
  - main.tf ( this will create the resources to spinup the eks cluster. also will configured iam roles, eks node group. it'll also configure the inbound and outbound traffic by allowing ports).
  - outputs.tf (
  - variables.tf

vpc (for configuring virtual private networking)
 - main.tf
 - outputs.tf
 - variables.tf


- main.tf (this code will create the eks cluster. I called two modules eks and vpc and point the path as well. this file also defines public cluster and desired sceling state.).
- variables.tf (this file printssome defined information like cluster id, cluster end point and cluster name).
- provider.tf (this file sets the remote backend for preserving the terraform state which can be found inside the workspace. I created this 'https://app.terraform.io/app/AWSLABTASK/workspaces/apptask'  
  workspace for demo. also defines the provider names and deployment region.)

