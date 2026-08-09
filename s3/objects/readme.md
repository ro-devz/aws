## create a new bucket

aws s3 mb s3://checksums-example-ab-1234


## create a file that we will checksum

echo "hello Mars" > myfile.txt

# get chekcsum
md5sum myfile.txt

# add to bucket and look at etag

aws s3 cp myfile.txt s3://checksums-example-ab-1234


aws s3api head-object --bucket checksums-example-ab-1234 --key myfile.txt


## use different kind of checksum

echo "hello Mars" > myfile2.txt
aws s3api put-object  --key="myfile2.txt" --bucket="checksums-example-ab-1234" --checksum-algorithm="SHA1"


# prefix
aws s3api put-object --bucket="checksums-example-ab-1234" --key="hello/"
aws s3api put-object --bucket="checksums-example-ab-1234" --key="hello/"
aws s3api put-object --bucket="checksums-example-ab-1234" --key="/lorem/ipsum/dolor/sit/amet,/consectetur/adipiscing/elit,/sed/do/eiusmod/tempor/incididunt/ut/labore/et/dolore/magna/aliqua./Ut/enim/ad/minim/veniam,/quis/nostrud/exercitation/ullamco/laboris/nisi/ut/aliquip/ex/ea/commodo/consequat./Duis/aute/irure/dolor/in/reprehenderit/in/voluptate/velit/esse/cillum/dolore/eu/fugiat/nulla/pariatur./Excepteur/sint/occaecat/cupidatat/non/proident,/sunt/in/culpa/qui/officia/deserunt/mollit/anim/id/est/laborum"


aws s3 ls  s3://checksums-example-ab-1234
aws s3api list-objects --bucket checksums-example-ab-1234


## If want to add body to the looooong thingy, it'll say object key too long!!"


## Metadata: