data "aws_iam_role" "lab_role" {
  name = "LabRole"
}

resource "aws_eks_cluster" "this" {
  name     = var.cluster_name
  role_arn = data.aws_iam_role.lab_role.arn
  version  = var.eks_version

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  tags = {
    Name = var.cluster_name
  }
}

resource "aws_eks_node_group" "this" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "${var.cluster_name}-nodes"
  node_role_arn   = data.aws_iam_role.lab_role.arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = var.desired_size
    min_size     = var.min_size
    max_size     = var.max_size
  }

  instance_types = [var.node_instance_type]

  tags = {
    Name = "${var.cluster_name}-nodes"
  }

  depends_on = [aws_eks_cluster.this]
}
