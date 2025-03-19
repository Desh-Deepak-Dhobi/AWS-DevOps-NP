import json

def lambda_handler(event, context):
    print("Lambda function started")
    
    # Intentional error: Division by zero
    result = 1 / 0
    
    return {
        'statusCode': 200,
        'body': json.dumps('This should not be reached!')
    }
