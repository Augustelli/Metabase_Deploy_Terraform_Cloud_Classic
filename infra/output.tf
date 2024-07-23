output "app_instance_ip" {
  description = "IP address of the app instance"
  value       = openstack_compute_instance_v2.tf_app.network.0.fixed_ip_v4
}

output "Red_Router" {
  description = "Router de la red"
  value =openstack_networking_router_v2.tf_router.external_network_id
}

output "Subnet_info" {
  description = "Información de la subred"
  value = {
    ip_version = openstack_networking_subnet_v2.tf_subnet.ip_version
    dns_nameservers = openstack_networking_subnet_v2.tf_subnet.dns_nameservers
    cidr = openstack_networking_subnet_v2.tf_subnet.cidr
  }
}

output "Metabase_instance" {
  description = "App Metabase"
  value = {
    access_ip_v4=openstack_compute_instance_v2.tf_app.network[0].fixed_ip_v4
    name = openstack_compute_instance_v2.tf_app.name
  }
}

output "Bastion_instance" {
  description = "Bastion"
  value = {
    access_ip_v4=openstack_compute_instance_v2.tf_bastion.network[0].fixed_ip_v4
    name = openstack_compute_instance_v2.tf_bastion.name
  }
}

output "Database_instance" {
  description = "DB MySql"
  value = {
    access_ip_v4=openstack_compute_instance_v2.tf_db.network[0].fixed_ip_v4
    name = openstack_compute_instance_v2.tf_db.name
  }
}

output "LoadBalancer_instance" {
  description = "LoadBalancer"
  value = {
    access_ip_v4=openstack_compute_instance_v2.tf_lb.network[0].fixed_ip_v4
    name = openstack_compute_instance_v2.tf_lb.name
  }
}


output "ssh_bastion" {
  description = "Comnado para entrar al bastion"
  value       = {
    user    = "ubuntu"
    command = "ssh -A ubuntu@${openstack_networking_floatingip_v2.tf_bastion_fip.address}"
    host    = openstack_networking_floatingip_v2.tf_bastion_fip.address
  }
}

output "lb_fip" {
  description = "Floating IP del loadbalancer"
  value = {
    url = "http://${openstack_networking_floatingip_v2.tf_lb_fip.address}"
  }
}

