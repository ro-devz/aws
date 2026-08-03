aws s3api list-buckets

aws s3api list-buckets --query Buckets[].Name --output table

aws s3api list-buckets --query "Buckets[?Name =='my-example-bucket-rdvz']" --output table

## copy files

aws s3 sync [path] s3://my-example-bucket-rdvz
aws s3 sync hello s3://my-example-bucket-rdvz