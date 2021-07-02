for each_svc_id in `aws --region us-west-2 servicediscovery list-services --query 'Services[].Id' --output text`
do
    echo "deleting the service $each_svc_id registerd in cloudmap"
    aws --region us-west-2 servicediscovery delete-service --id $each_svc_id
done

for each_namespace_id in `aws --region us-west-2 servicediscovery list-namespaces --query 'Namespaces[].Id' --output text`
do
    echo "deleting the namespace $each_namespace_id registerd in cloudmap"
    aws --region us-west-2 servicediscovery delete-namespace --id $each_namespace_id
done