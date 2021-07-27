#!/bin/bash 
Region="us-west-2"
for eachnotebook in `aws --region $Region sagemaker list-notebook-instances --output text --query 'NotebookInstances[].NotebookInstanceName'`
do 
   echo "deleting node $eachnotebook"
   aws --region $Region sagemaker delete-notebook-instance --notebook-instance-name $eachnotebook
done