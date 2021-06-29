repository_list=`aws --region us-west-2 ecr describe-repositories --query 'repositories[].repositoryName' --output text`
for eachrepo_id in $repository_list
do 
   echo "deleting repository '$eachrepo_id'"
   aws --region us-west-2 ecr delete-repository --repository-name $eachrepo_id --force
done