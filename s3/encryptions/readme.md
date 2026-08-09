## create bucket

aws s3 mb s3://encrypt-rdvz

## add files
echo "test" > hello.txt
aws s3 cp hello.txt s3://encrypt-rdvz

## add other files with encryption 
### first create KMS key
didn't continue 'cause it's a paid servie.


```sh
aws kms list-keys
```

```sh
echo "test" > hello2.txt

aws s3api put-object \
--key hello2.txt \
--bucket encrypt-rdvz \
--body hello.txt \
--server-side-encryption "aws:kms"
--ssekms-key-id "id"
```

## SSE-c

```sh
openssl rand -out ssc.key 32

aws s3 cp hello.txt s3://encrypt-rdvz \
  --sse-c AES256 \
  --sse-c-key fileb://ssec.key



  OR 

export KEY=$(openssl rand -base64 32)
export MD5=$(echo "$KEY" | base64 --decode | openssl md5 -binary | base64)

aws s3api put-object \
  --key hello2.txt \
  --bucket encrypt-rdvz \
  --body hello.txt \
  --sse-customer-algorithm AES256 \
  --sse-customer-key "$KEY" \
  --sse-customer-key-md5 "$MD5"

Download

aws s3 cp s3://encrypt-rdvz/hello.txt hello.txt
aws s3 cp s3://encrypt-rdvz/hello.txt hello.txt --sse-c AES256 --sse-c-key fileb://ssc.key
```