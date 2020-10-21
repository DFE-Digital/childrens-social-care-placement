provider "cloudfoundry" {
  api_url  = "https://api.london.cloud.service.gov.uk"
  user     = var.user
  password = var.password
}

terraform {
  required_version = ">= 0.13.4"
  required_providers {
    cloudfoundry = {
      source  = "cloudfoundry-community/cloudfoundry"
      version = "0.12.6"
    }
  }
}

data "cloudfoundry_org" "my_org" {
  name = "dfe-childrens-social-care-services"
  // var.cf_org
}

data "cloudfoundry_space" "placement-alpha-development" {
  name = "placement-alpha-development"
  // var.space
  org = data.cloudfoundry_org.my_org.id
}

data "cloudfoundry_service" "postgres" {
  name = "postgres"
}

resource "cloudfoundry_service_instance" "postgres" {
  name = "development-db"
  space = data.cloudfoundry_space.placement-alpha-development.id
  service_plan = "medium-11"
}

resource "cloudfoundry_domain" "default_domain" {
  sub_domain = "childrens-social-care-placement-dev"
  domain = "london.cloudapps.digital"
}

resource "cloudfoundry_route" "childrens-social-care-placement-dev" {
  domain = cloudfoundry_domain.default_domain.id
  space = data.cloudfoundry_space.placement-alpha-development.id
}

resource "cloudfoundry_buildpack" "ruby" {
  name = "ruby_buildpack"
  path = "https://github.com/cloudfoundry/ruby-buildpack/archive/master.zip"
  position = "1"
}

resource "cloudfoundry_buildpack" "node" {
  name = "nodejs_buildpack"
  path = "https://github.com/cloudfoundry/nodejs-buildpack/archive/master.zip"
  position = "2"
}

resource "cloudfoundry_app" "childrens-social-care-placement" {
  name = "childrens-social-care-placement"
  space = data.cloudfoundry_space.placement-alpha-development.id
  path = "https://github.com/DFE-Digital/childrens-social-care-placement/archive/master.zip"
  buildpack = ""
  service_binding {
    service_instance = cloudfoundry_service_instance.postgres.id
  }
}