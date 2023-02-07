resource "github_repository" "modules" {
  name        = "terffarom-demo"
  description = "Terraform demo repository"
  visibility  = "public"
  auto_init   = true
}

resource "github_branch" "master" {
  repository = github_repository.modules.name
  branch     = "master"
}

resource "github_branch_default" "default"{
  repository = github_repository.modules.name
  branch     = github_branch.master.branch
}

resource "github_repository_file" "file" {
#   count = length(var.files)

  for_each = fileset("${path.module}/../modules/service", "*")

  repository          = github_repository.modules.name
  branch              = github_branch.master.branch
  #file                = "service/${element(var.files, count.index)}"
  #content             = file("/vagrant/3_terraform/modules/service/${element(var.files, count.index)}")
  
  file                = "service2/${each.value}"
  content             = file("${path.module}/../modules/service/${each.value}")
  
  commit_message      = "Managed by Terraform"
  commit_author       = "Alina Freydina"
  commit_email        = "alina.freydina@gmail.com"
  overwrite_on_create = true
}
