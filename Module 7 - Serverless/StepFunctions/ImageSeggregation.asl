{
  "Comment": "A Step Function to process file types and send notifications",
  "StartAt": "CheckFileTypes",
  "States": {
    "CheckFileTypes": {
      "Type": "Choice",
      "Choices": [
        {
          "Or": [
            {
              "Variable": "$.detail.object.key",
              "StringMatches": "*.png"
            },
            {
              "Variable": "$.detail.object.key",
              "StringMatches": "*.jpeg"
            },
            {
              "Variable": "$.detail.object.key",
              "StringMatches": "*.gif"
            }
          ],
          "Next": "NotifyImageTopic"
        },
        {
          "Or": [
            {
              "Variable": "$.detail.object.key",
              "StringMatches": "*.mp4"
            },
            {
              "Variable": "$.detail.object.key",
              "StringMatches": "*.wmv"
            },
            {
              "Variable": "$.detail.object.key",
              "StringMatches": "*.mov"
            }
          ],
          "Next": "NotifyVideoTopic"
        }
      ],
      "Default": "NoFilesFound"
    },
    "NotifyImageTopic": {
      "Type": "Task",
      "Resource": "arn:aws:states:::sns:publish",
      "Parameters": {
        "Message": {
          "message.$": "States.Format('Image files processed: {}.', $.detail.object.key)"
        },
        "TopicArn": "arn:aws:sns:us-east-1:031342435657:PhotographyTeam"
      },
      "Next": "EndState"
    },
    "NotifyVideoTopic": {
      "Type": "Task",
      "Resource": "arn:aws:states:::sns:publish",
      "Parameters": {
        "Message": {
          "message.$": "States.Format('Video files processed: {}.', $.detail.object.key)"
        },
        "TopicArn": "arn:aws:sns:us-east-1:031342435657:deshvideoTeam"
      },
      "Next": "EndState"
    },
    "NoFilesFound": {
      "Type": "Fail",
      "Error": "NoFilesFound",
      "Cause": "No files to process"
    },
    "EndState": {
      "Type": "Succeed"
    }
  }
}
