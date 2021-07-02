#!/bin/bash
export AWS_ACCESS_KEY_ID="REPLACE_ACCESS_KEY"
export AWS_SECRET_ACCESS_KEY="REPLACE_SECRET_ACCESS_KEY"

InstanceId="REPLACE_INSTANCE_ID"
Region="REGION"
VolumeName="VOLUME_NAME_TAG_VALUE"
Availability_zone="VOLUME_AVAILABILITY_ZONE"
VolumeSize="VolumeSize"
DeviceType="/dev/sdg"

#######################
# VolumeCreation ######
#######################

echo "creating a volume"  
volumeid=`aws --region $Region ec2 create-volume --availability-zone $Availability_zone --volume-type gp3 --size $VolumeSize --tag-specifications "ResourceType=volume,Tags=[{Key=Name,Value=$VolumeName}]" --query 'VolumeId' --output text`
echo "Waiting for volume to be available"
aws --region $Region ec2 wait volume-available --volume-ids $volumeid
echo "Attaching a volume to instance"
aws --region $Region ec2 attach-volume --device $DeviceType --instance-id $InstanceId --volume-id $volumeid
echo "waiting for volume to associate and set to in-use"
aws --region $Region ec2 wait volume-in-use --volume-ids $volumeid



