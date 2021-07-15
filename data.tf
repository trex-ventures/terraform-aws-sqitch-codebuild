data "template_file" "buildspec" {
  template = <<EOF
version: 0.2
phases:
  build:
    commands: 
      - ./scripts/sqitch.sh
EOF
}
