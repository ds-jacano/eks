name_prefix = "eks-eu-test"

vpc_cidr              = "10.100.0.0/16"
# We need at least 2 AZs for EKS, but we'll optimize traffic patterns
public_subnets_cidrs  = ["10.100.192.0/20", "10.100.208.0/20"]
azs                   = ["eu-west-1a", "eu-west-1b"]

eks_enabled_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
eks_service_ipv4_cidr = "10.190.0.0/16"

instance_types = ["t3.large"]

eks_public_access_cidrs = [
  "0.0.0.0/0"
]

eks_version = "1.32"

eks_addon_version_kube_proxy                      = "v1.32.3-eksbuild.7"
eks_addon_version_core_dns                        = "v1.11.4-eksbuild.10"
eks_addon_version_ebs_csi_driver                  = "v1.43.0-eksbuild.1"
eks_addon_version_snapshot_controller             = "v8.2.0-eksbuild.1"
eks_addon_version_amazon_cloudwatch_observability = "v4.0.1-eksbuild.1"
eks_addon_version_metrics_server                  = "v0.7.2-eksbuild.3"
eks_addon_version_kube_state_metrics              = "v2.15.0-eksbuild.4"
eks_addon_version_identity_agent                  = "v1.3.7-eksbuild.2"
