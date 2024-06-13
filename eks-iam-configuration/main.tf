provider "aws" {
  region = "your-region"
}

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

# Example IAM role and policy for EKS access
resource "aws_iam_role" "example-service-role" {
  name = "example-service-role"
  # role configuration for service access
}

resource "aws_iam_role_policy_attachment" "example-service-policy" {
  role       = aws_iam_role.example-service-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
  # attach other policies as needed
}
