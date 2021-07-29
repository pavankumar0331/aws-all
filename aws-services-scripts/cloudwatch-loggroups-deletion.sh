#!/bin/bash
Region="us-west-2"
for eachloggroup in `aws --region $Region logs describe-log-groups --output text --query 'logGroups[].logGroupName'`
do
   echo "deleting loggroup named $eachloggroup"
   aws --region $Region logs delete-log-group --log-group-name $eachloggroup
done