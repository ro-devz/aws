require 'aws-sdk-s3'
require 'securerandom'

bucket_name = ENV['BUCKET_NAME']
region = 'eu-west-3'

if bucket_name.nil? || bucket_name.empty?
  abort "Set BUCKET_NAME env var first."
end

puts "Bucket: #{bucket_name} (#{region})"

client = Aws::S3::Client.new(region: region)

begin
  client.create_bucket(
    bucket: bucket_name,
    create_bucket_configuration: { location_constraint: region }
  )
  puts "Bucket created."
rescue Aws::S3::Errors::BucketAlreadyOwnedByYou
  puts "Bucket already exists and is owned by you — continuing."
rescue Aws::S3::Errors::BucketAlreadyExists
  abort "Bucket name is taken by another account. Choose a different name."
end

number_of_files = 1 + rand(5)
puts "number_of_files: #{number_of_files}"

number_of_files.times do |i|
  puts " i: #{i}"
  filename = "file_#{i}.txt"
  output_path = "/tmp/#{filename}"
  content = SecureRandom.uuid

  File.write(output_path, content)

  File.open(output_path, 'r') do |file|
    client.put_object(bucket: bucket_name, key: filename, body: file)
  end
end

puts "Done."