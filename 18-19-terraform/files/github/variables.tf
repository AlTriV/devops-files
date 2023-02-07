variable "tf_token" {}

variable "files" {
  description = "List of files to be put into github repo"
  default = [
    "main.tf",
    "variables.tf"
  ]
}