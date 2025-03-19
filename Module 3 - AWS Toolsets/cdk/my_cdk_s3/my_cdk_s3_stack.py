import aws_cdk as cdk
from aws_cdk import Stack, CfnOutput
from aws_cdk import aws_s3 as s3
from constructs import Construct

class MyCdkS3Stack(Stack):

    def __init__(self, scope: Construct, construct_id: str, **kwargs) -> None:
        super().__init__(scope, construct_id, **kwargs)

        # Create an S3 Bucket
        bucket = s3.Bucket(self, "MyS3Bucket",
                  bucket_name="my-cdk-python-466363",  # Change as needed
                  versioned=True,
                  removal_policy=cdk.RemovalPolicy.DESTROY,  # Delete on stack deletion
                  auto_delete_objects=True)  # Auto delete objects when bucket is removed

        # Output the bucket name
        CfnOutput(self, "BucketNameOutput",
                  value=bucket.bucket_name,
                  description="The name of the created S3 bucket",
                  export_name="MyS3BucketName")
