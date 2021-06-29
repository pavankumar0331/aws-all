policy_ids=`aws --region us-west-2 dlm get-lifecycle-policies --query 'Policies[].PolicyId' --output text`
for eachpolicy_id in $policy_ids
do 
   echo "deleting policy id $eachpolicy_id"
   aws --region us-west-2 dlm delete-lifecycle-policy --policy-id $eachpolicy_id
done