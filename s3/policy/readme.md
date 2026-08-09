# Policies

```sh
aws s3 mb s3://example-policy-rdvz

# check what user to get info accros account
aws s3api put-bucket-policy --bucket example-policy-rdvz --policy file://policy.json

```

Then go to other account, and do 
```sh
aws s3 ls s3://example-policy-rdvz
touch test.txt
aws s3 cp test.txt s3://example-policy-rdvz
```

# cleanup

```sh
aws s3 rm s3://example-policy-rdvz/test.txt
aws s3 rb s3://example-policy-rdvz
```