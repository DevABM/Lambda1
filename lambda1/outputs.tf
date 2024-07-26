output "lambda_function_name" {
  description = "The name of the Lambda function"
  value       = aws_lambda_function.fetch_resume_data.function_name
}

output "dynamodb_table_name" {
  description = "The name of the DynamoDB table"
  value       = aws_dynamodb_table.resume_table.name
}

output "lambda_function_arn" {
  description = "The ARN of the Lambda function"
  value       = aws_lambda_function.fetch_resume_data.arn
}

output "dynamodb_table_arn" {
  description = "The ARN of the DynamoDB table"
  value       = aws_dynamodb_table.resume_table.arn
}

