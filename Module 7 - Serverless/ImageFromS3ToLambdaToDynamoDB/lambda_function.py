import json
import boto3
from datetime import datetime

# Initialize the DynamoDB client
dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('S3ObjectMetadata')

def lambda_handler(event, context):
    # Parse the S3 event
    for record in event['Records']:
        bucket_name = record['s3']['bucket']['name']
        object_key = record['s3']['object']['key']
        object_size = record['s3']['object']['size']
        event_time = record['eventTime']
        
        # Prepare the item to be stored in DynamoDB
        item = {
            'ObjectKey': object_key,
            'BucketName': bucket_name,
            'ObjectSize': object_size,
            'EventTime': event_time,
            'LastModified': datetime.now().isoformat()
        }
        
        # Store the item in DynamoDB
        table.put_item(Item=item)
    
    return {
        'statusCode': 200,
        'body': json.dumps('Metadata stored in DynamoDB')
    }
