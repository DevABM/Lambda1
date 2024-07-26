import json
import os
import boto3
from botocore.exceptions import ClientError

def lambda_handler(event, context):
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table(os.environ['TABLE_NAME'])
    response = table.scan()
    items = response['Items']
    formatted_items = [
        {
            "id": item["id"],
            "name": item["name"],
            "email": item["email"],
            "phone": item["phone"],
            "experience": item["experience"]
        }
        for item in items
    ]
    
    return {
            'statusCode': 200,
            'body': json.dumps(formatted_items, indent=4),
            'headers' : {
                'Content-Type': 'application/json'
            }
        }
    
