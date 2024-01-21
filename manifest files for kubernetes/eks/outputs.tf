output "endpoint" {
  value = aws_eks_cluster.apptask.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.apptask.certificate_authority[0].data
}
output "cluster_id" {
  value = aws_eks_cluster.apptask.id
}
output "cluster_endpoint" {
  value = aws_eks_cluster.apptask.endpoint
}
output "cluster_name" {
  value = aws_eks_cluster.apptask.name
}
