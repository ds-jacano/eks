data "aws_vpc_endpoint_service" "ecr_dkr" {
  service_type = "Interface"
  filter {
    name   = "service-name"
    values = ["${data.aws_partition.current.reverse_dns_prefix}.${data.aws_region.current.name}.ecr.dkr"]
  }
}

data "aws_vpc_endpoint_service" "sts" {
  service_type = "Interface"
  filter {
    name   = "service-name"
    values = ["${data.aws_partition.current.reverse_dns_prefix}.${data.aws_region.current.name}.sts"]
  }
}

data "aws_vpc_endpoint_service" "s3" {
  service_type = "Interface"
  filter {
    name   = "service-name"
    values = ["${data.aws_partition.current.reverse_dns_prefix}.${data.aws_region.current.name}.s3"]
  }
}

data "aws_vpc_endpoint_service" "s3_gateway" {
  service_type = "Gateway"
  filter {
    name   = "service-name"
    values = ["${data.aws_partition.current.reverse_dns_prefix}.${data.aws_region.current.name}.s3"]
  }
}

data "aws_iam_policy_document" "eks_vpc_aps_workspaces" {
  statement {
    actions = [
      "aps:*",
    ]

    resources = ["arn:${data.aws_partition.current.partition}:aps:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:/workspaces*"]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}

data "aws_vpc_endpoint_service" "aps_workspaces" {
  service_type = "Interface"
  filter {
    name   = "service-name"
    values = ["${data.aws_partition.current.reverse_dns_prefix}.${data.aws_region.current.name}.aps-workspaces"]
  }
}

