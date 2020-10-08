data "template_file" "buildspec" {
  template = <<EOF
version: 0.2
phases:
  pre_build:
    commands:
      - ./scripts/assume_role.sh -r arn:aws:iam::015110552125:role/BeiartfWriter_$${product_domain}
  build:
    commands: 
      - ./scripts/sqitch_codebuild.sh
EOF

  vars = {
    product_domain = "${var.product_domain}" 
  }
}

