# Terraform AWS Sqitch Codebuild

[![Terraform Version](https://img.shields.io/badge/Terraform%20Version-0.11.14-blue.svg)](https://releases.hashicorp.com/terraform/)
[![Release](https://img.shields.io/github/release/traveloka/terraform-aws-sqitch-codebuild.svg)](https://github.com/traveloka/terraform-aws-sqitch-codebuild/releases)
[![Last Commit](https://img.shields.io/github/last-commit/traveloka/terraform-aws-sqitch-codebuild.svg)](https://github.com/traveloka/terraform-aws-sqitch-codebuild/commits/master)
[![Issues](https://img.shields.io/github/issues/traveloka/terraform-aws-sqitch-codebuild.svg)](https://github.com/traveloka/terraform-aws-sqitch-codebuild/issues)
[![Pull Requests](https://img.shields.io/github/issues-pr/traveloka/terraform-aws-sqitch-codebuild.svg)](https://github.com/traveloka/terraform-aws-sqitch-codebuild/pulls)
[![License](https://img.shields.io/github/license/traveloka/terraform-aws-sqitch-codebuild.svg)](https://github.com/traveloka/terraform-aws-sqitch-codebuild/blob/master/LICENSE)
![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.png?v=103)

This repository contains a terraform module to create a CodeBuild pipeline for deploying Sqitch SQL migration framework to RDS instances in the same account. 

## Table of Content

- [Prerequisites](#Prerequisites)
- [Quick Start](#Quick-Start)
- [Dependencies](#Dependencies)
- [Contributing](#Contributing)
- [Contributor](#Contributor)
- [License](#License)
- [Acknowledgments](#Acknowledgments)

## Prerequisites

For Terraform version, this module has been tested on terraform 0.11.14. It might not run correctly on 0.12 or above. 

For terraform Providers:

- Provider [aws](https://www.terraform.io/docs/providers/aws/index.html) version `2.70.0`. We are not recommending usage of `3.0.0` and above.
- Provider [random](https://www.terraform.io/docs/providers/random/index.html) version `2.3.0`.

## Dependencies

This module will need resources created with the [terraform-aws-sqitch-codebuild-shared-resources](https://github.com/traveloka/terraform-aws-sqitch-codebuild-shared-resources) module.

## Variables


## Examples

Go to the `example` directory, there are two example provided there. The `simple` directory uses the bare minimum variables needed, while the `complete` directory provides argument for buildspec and additional environment variables.

## Versioning

We use [SemVer](https://semver.org/) for our versioning

**Latest stable version** `v0.2.0`, 13th October 2020

**Latest version** `v0.2.0`, 13th October 2020

**Latest release** :

- Add option to supply buildspec directly and add environment variables

Please also see our `CHANGELOG` document in this repository and see more detail

## Contributing

Please see our example of `CONTRIBUTING` document

## Maintainer

For question, issue, and pull request you can contact these people

- [Christianto Handojo](https://github.com/handojo1) (**Author**)

## License

This module is licensed under Apache License 2.0 - see the `LICENSE` file for details

## Acknowledgments

Finally, add some useful link and source and give appreciation to their share

- [Readme Template](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2)
- [Friendly Readme](https://rowanmanning.com/posts/writing-a-friendly-readme/)
- [Opensource Guide](https://opensource.guide/starting-a-project/)
- Inspiration from other open source
