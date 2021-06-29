#!/bin/bash -xe
users_list=`aws iam list-users --output text --query 'Users[].UserName'`
##remove AWS Managed/User Managed IAM policies from users
for eachuser in $users_list
do
    policy_list=`aws iam list-attached-user-policies --user-name $eachuser --output text --query AttachedPolicies[].PolicyArn`
    echo "Removing user '$eachuser' permissions"
    for eachpolicy in $policy_list
    do
        echo "detaching policy '$eachpolicy' from user '$eachuser'"
        aws iam detach-user-policy --user-name $eachuser --policy-arn $eachpolicy
    done
done