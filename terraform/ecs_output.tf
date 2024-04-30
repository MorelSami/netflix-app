output "service_externl_ip" {
  value = {
    arn = aws_ecs_service.my_service.id
    external_ip = aws_ecs_service.my_service.network_configuration[0].assign_public_ip
    type = aws_ecs_service.my_service.launch_type
    tags = aws_ecs_service.my_service.tags_all
  }
  description = "The service ip address and type."
}

