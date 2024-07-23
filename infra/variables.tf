variable "key_name" {
  type    = string
  //default = UMCLOUD" EJEMPLO
  default = "-------------------- REMPLAZAR ---------------------------"
}
variable "google_db_name" {
  description = "Nombre de la base de datos"
  //default     = "google" EJEMPLO
  default     = "-------------------- REMPLAZAR ---------------------------"
}

variable "google_db_user" {
  description = "Usuario para la base de datos"
  //default     = "root"
  default     = "-------------------- REMPLAZAR ---------------------------"
}

variable "google_db_password" {
  description = "Contraseña para el usuario."
  type        = string
  sensitive   = true
}