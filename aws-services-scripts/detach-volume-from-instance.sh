#!/bin/bash

export AWS_ACCESS_KEY_ID="REPLACE_ACCESS_KEY"
export AWS_SECRET_ACCESS_KEY="REPLACE_SECRET_ACCESS_KEY"

InstanceId="REPLACE_INSTANCE_ID"
Region="REGION"
VolumeName="VOLUMENAME_NAME_TAG_VALUE"

#########################
# Deletion of Volume ####
#########################
volumeId=`aws --region $Region ec2 describe-volumes --filters "Name=tag:Name,Values=$VolumeName" --query 'Volumes[].VolumeId' --output text`
echo "detaching a volume from instance"
aws --region $Region ec2 detach-volume --volume-id $volumeId --instance-id $InstanceId
echo "Waiting for volume to be available"
aws --region $Region ec2 wait volume-available --volume-ids $volumeId
echo "deleting volume"
aws --region $Region ec2 delete-volume --volume-id $volumeId