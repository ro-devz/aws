aws s3api list-buckets

aws s3api list-buckets --query Buckets[].Name --output table

aws s3api list-buckets --query "Buckets[?Name =='my-example-bucket-rdvz']" --output table

## copy files

aws s3 sync [path] s3://my-example-bucket-rdvz
aws s3 sync hello s3://my-example-bucket-rdvz # no only for folder!!

## put file

aws s3api put-object --bucket my-example-bucket-rdvz --key hello.txt --content-type plain/txt --body hello.txt

aws s3api list-objects --bucket my-example-bucket-rdvz --query Contents


# This will also list "directory"
aws s3api list-objects --bucket my-example-bucket-rdvz --query Contents[].Key