variable "key_name" {
  type    = string
  default = "-------------------- REMPLAZAR ---------------------------"
}
variable "google_db_name" {
  description = "Nombre de la base de datos"
  default     = "-------------------- REMPLAZAR ---------------------------"
}

variable "google_db_user" {
  description = "Usuario para la base de datos"
  default     = "-------------------- REMPLAZAR ---------------------------"
}

variable "google_db_password" {
  description = "Contraseña para el usuario."
  type        = string
  sensitive   = true
}