resource "openstack_compute_instance_v2" "tf_app" {
  name              = "metabase-ip"
  image_id          = data.openstack_images_image_v2.ubuntu_2204.id
  flavor_id         = data.openstack_compute_flavor_v2.small.id
  key_pair          = var.key_name
  security_groups   = [openstack_compute_secgroup_v2.tf_sg_app.name]
  availability_zone = "nodos-amd-2022"

    user_data = templatefile("${path.module}/templates/vm-app.init.sh", {
    db_ip  = openstack_compute_instance_v2.tf_db.network.0.fixed_ip_v4
    fe_fip = openstack_networking_floatingip_v2.tf_lb_fip.address,
  })

  network {
    name = openstack_networking_network_v2.tf_net.name
  }

  depends_on = [
    openstack_networking_subnet_v2.tf_subnet,
  ]
}
