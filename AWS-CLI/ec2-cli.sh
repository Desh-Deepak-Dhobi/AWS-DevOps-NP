#!/bin/bash

# Step 1: Launch EC2 Instance and Capture Instance ID
INSTANCE_ID=$(aws ec2 run-instances \
  --image-id ami-0f9575d3d509bae0c \
  --instance-type t2.micro \
  --key-name deshtest \
  --security-groups default \
  --query "Instances[0].InstanceId" \
  --output text)

echo "EC2 Instance is launching... ID: $INSTANCE_ID"

# Step 2: Wait until Instance is in Running State
aws ec2 wait instance-running --instance-ids $INSTANCE_ID
echo "Instance $INSTANCE_ID is now running!"

# Step 3: Wait until EC2 Status Checks Pass (Both Instance & System Checks)
aws ec2 wait instance-status-ok --instance-ids $INSTANCE_ID
echo "Instance $INSTANCE_ID has passed status checks and is ready!"

# Step 4: Retrieve the Public IP
PUBLIC_IP=$(aws ec2 describe-instances \
  --instance-ids $INSTANCE_ID \
  --query "Reservations[0].Instances[0].PublicIpAddress" \
  --output text)

echo "EC2 Instance Public IP: $PUBLIC_IP"

# Optional Step: SSH into EC2 (Only if required)
# ssh -i MyKeyPair.pem ec2-user@$PUBLIC_IP

# Optional Cleanup: Terminate the Instance
# aws ec2 terminate-instances --instance-ids $INSTANCE_ID
# aws ec2 wait instance-terminated --instance-ids $INSTANCE_ID
# echo "Instance $INSTANCE_ID has been terminated!"
