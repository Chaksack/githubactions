resource "aws_eks_cluster" "example" {
  name     = "example-cluster"
  role_arn = aws_iam_role.example.arn

  # other EKS cluster configuration
}

resource "aws_iam_role" "example" {
  name = "example-eks-role"
  # role configuration for EKS
}

resource "aws_iam_role_policy_attachment" "example-eks-policy" {
  role       = aws_iam_role.example.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  # attach other policies as needed
}