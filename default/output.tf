Practice Instance Outputs
    
output "Practice_Public_Instance_ID" {
    description = "ID for Practice_Public Instance"
    value = aws_instance.Practice_Public.id
}

output "Practice_Private_Instance_ID" {
    description = "ID for Practice_Private Instance"
    value = aws_instance.Practice_Private.id  
}

