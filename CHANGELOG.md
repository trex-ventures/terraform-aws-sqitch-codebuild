## v1.0.0 (May 31, 2021)

FEATURES: 
* Terraform 12 syntax (breaks compatibility with terraform 0.11)

BUGFIXES:
* vpc_subnet_app_ids are passed directly now instead of being put into another list (this is somehow OK in terraform 0.11) 

## v0.5.0 (May 6, 2021)

FEATURES:
* Allow supplying ImagePullCredentialType

## v0.4.0 (May 6, 2021)

FEATURES:
* Allow supplying custom codebuild image

## v0.3.0 (Dec 8, 2020)

FEATURES:

* Allow supplying default branch / tag to be checked out

## v0.2.0 (Oct 13, 2020)

FEATURES:

* Allow supplying additional environment variable and custom buildspec ([#001](https://github.com/traveloka/terraform-aws-sqitch-codebuild/issues/1))

## v0.1.0 (Jan 1, 2019)

Initial release
