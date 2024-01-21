Terraform Code for AWS EKS Cluster: This code will deploy single node in the cluster and can be modified for more as per requirement.
File Structure:
Workflow
 - eks.yml (this file call plan.yml and apply.yml and will execute plan.yml first then apply.yml.)
 - aws_tf_plan.yml
 - aws_tf_apply.yml

Manifest files for Kubernetes
 eks
  - main.tf ( this will create the resources to spinup the eks cluster. also will configured iam roles, eks node group. it'll also configure the inbound and outbound traffic by allowing ports).
  - outputs.tf (it will print certain outputs.).
  - variables.tf(this will given as a input from the main.tf under "manifest files for kubernetes" directory.).

vpc (for configuring virtual private networking)
 - main.tf (this code will create vpc, subnets and internet gateway).
 - outputs.tf
 - variables.tf


- main.tf (this code will create the eks cluster. I called two modules eks and vpc and point the path as well. this file also defines public cluster and desired sceling state.).
- variables.tf (this file printssome defined information like cluster id, cluster end point and cluster name).
- provider.tf (this file sets the remote backend for preserving the terraform state which can be found inside the workspace. I created this 'https://app.terraform.io/app/AWSLABTASK/workspaces/apptask'  
  workspace for demo. also defines the provider names and deployment region.)

