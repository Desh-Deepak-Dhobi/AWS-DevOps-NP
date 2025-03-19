import aws_cdk as core
import aws_cdk.assertions as assertions

from my_cdk_s3.my_cdk_s3_stack import MyCdkS3Stack

# example tests. To run these tests, uncomment this file along with the example
# resource in my_cdk_s3/my_cdk_s3_stack.py
def test_sqs_queue_created():
    app = core.App()
    stack = MyCdkS3Stack(app, "my-cdk-s3")
    template = assertions.Template.from_stack(stack)

#     template.has_resource_properties("AWS::SQS::Queue", {
#         "VisibilityTimeout": 300
#     })
