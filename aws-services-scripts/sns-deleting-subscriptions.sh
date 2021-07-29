#!/bin/bash
Region="us-west-2"
##The script is deleting subscriptions whose protocol matches 'email'
for eachsub in $(aws --region $Region sns list-subscriptions --output text --query 'Subscriptions[?Protocol == `email`].SubscriptionArn')
do
   echo "deleting subscriptions $eachsub"
   aws --region $Region sns unsubscribe --subscription-arn $eachsub
done