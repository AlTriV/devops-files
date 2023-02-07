variable "mysql_port" {}
variable "wp_port" {}
variable "wp_srv_port" {}
variable "create" {
  default = true
}

variable "env" {
  default = "dev"
}

variable "app_name" {
  default = "wordpress"
}

variable "mysql_wp_db_name" {
  default = "exampledb"
}
variable "mysql_wp_db_user" {
  default = "exampleuser"
}
variable "mysql_wp_db_pawword" {
  default = "examplepass"
}
variable "mysql_wp_db_root_password" {
  default = "examplepass"
}