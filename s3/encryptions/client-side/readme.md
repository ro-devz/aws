# CSE

bundle init

Make the rem file
add the new encrypt.rb file
bunble install
bundle exec ruby encrypt.rb

```ruby
require 'aws-sdk-s3'
require 'openssl'
#key = OpenSSL::PKey::RSA.new(1024)
key = "hello.txt"
# encryption client
s3 = Aws::S3::EncryptionV2::Client.new(
  encryption_key: key,
  key_wrap_schema: :rsa_oaep_sha1, # the key_wrap_schema must be rsa_oaep_sha1 for asymmetric keys
  content_encryption_schema: :aes_gcm_no_padding,
  security_profile: :v2 # use :v2_and_legacy to allow reading/decrypting objects encrypted by the V1 encryption client
)
# round-trip an object, encrypted/decrypted locally
s3.put_object(bucket:'aws-sdk', key:'secret.txt', body:'handshake')
s3.get_object(bucket:'aws-sdk', key:'secret.txt').body.read
#=> 'handshake'

# reading encrypted object without the encryption client
# results in the getting the cipher text
Aws::S3::Client.new.get_object(bucket:'aws-sdk', key:'secret.txt').body.read
#=> "... cipher text ..."
```