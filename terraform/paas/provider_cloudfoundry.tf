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
  service_plan = data.cloudfoundry_service.postgres.service_plans["medium-11"]
}

data "cloudfoundry_domain" "dev" {
  name = "london.cloudapps.digital"
}

resource "cloudfoundry_route" "dev_route" {
  domain = data.cloudfoundry_domain.dev.id
  space = data.cloudfoundry_space.placement-alpha-development.id
  hostname = "childrens-social-care-placement-dev"
}

resource "cloudfoundry_app" "childrens-social-care-placement-dev" {
  name = "childrens-social-care-placement-dev"
  space = data.cloudfoundry_space.placement-alpha-development.id
  docker_image = var.csc_docker_repo
  service_binding {
    service_instance = cloudfoundry_service_instance.postgres.id
  }
  routes {
    route = cloudfoundry_route.dev_route.id
  }

}