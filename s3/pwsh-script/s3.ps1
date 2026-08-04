Import-Module AWS.Tools.S3

$region = "eu-west-3"
$bucketName = Read-Host -Prompt "Enter bucket name"

Write-Host "AWS Region: $region"
Write-Host "AWS Bucket: $bucketName"

function BucketExists {
    param($Name, $Region)
    $bucket = Get-S3Bucket -BucketName $Name -Region $Region -ErrorAction SilentlyContinue
    return $null -ne $bucket
}

if (-not (BucketExists -Name $bucketName -Region $region)) {
    Write-Host "Bucket does not exist. Creating..."
    New-S3Bucket -BucketName $bucketName -Region $region
} else {
    Write-Host "Bucket already exists"
}

# Create a new file
$fileName = 'myfile.txt'
$fileContent = 'Hello Here'
Set-Content -Path $fileName -Value $fileContent

Write-S3Object -BucketName $bucketName -File $fileName -Key $fileName -Region $region