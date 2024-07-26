resource "null_resource" "add_initial_data" {
  provisioner "local-exec" {
    command = <<EOT
    retries=5
      while [ $retries -gt 0 ]; do
        aws dynamodb put-item --region ${var.aws_region} --table-name ${aws_dynamodb_table.resume_table.name} --item '{"id": {"S": "1"}, "name": {"S": "Amudha Balamurugan"}, "email": {"S": "abroadabm@gmail.com"}, "phone": {"S": "123-456-7890"}, "experience": {"S": "5 years in software development"} "Projects}'
        if [ $? -eq 0 ]; then
          break
        fi
        sleep 10
        retries=$((retries-1))
      done

      retries=5
      while [ $retries -gt 0 ]; do
        aws dynamodb put-item --region ${var.aws_region} --table-name ${aws_dynamodb_table.resume_table.name} --item '{"id": {"S": "2"}, "name": {"S": "Jane Smith"}, "email": {"S": "jane.smith@example.com"}, "phone": {"S": "987-654-3210"}, "experience": {"S": "3 years in project management"}}'
        if [ $? -eq 0 ]; then
          break
        fi
        sleep 10
        retries=$((retries-1))
      done 
      EOT
  }

  depends_on = [aws_dynamodb_table.resume_table]
}
