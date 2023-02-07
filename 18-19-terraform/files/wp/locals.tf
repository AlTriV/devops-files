locals {
  labels = {
    environment = var.env
    app         = var.app_name
    instance    = "infrastructure"
  }

  prefix = "${var.env}-${var.app_name}"
}