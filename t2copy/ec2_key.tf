provider "aws" {
region = "ap-south-1"
profile = "abhi"
}



resource "aws_key_pair" "deployer" {
  key_name   = "terrkey"
  public_key = "ssh-rsa AAAAB3JFhBXYefAtBhvSznuPTvTfW3Zv6kJ7cQsa2XaNi6/yru6FjQ/SbUAP6YlQ8uTccrCWxjVWSf9wjOtT0NLkf+hL0a63uuBcWQq9km3grWAZwMYgU4qSlSXRARJ6RfFXAUq1AwPhNd5/d7YdQCg/WlmJJuzwPfmsEDKGlsUpPUOopxiFwNBqYoYV5L1XHgLOZ8Q4dAVSaQM1Xm/tynkRhKt"
}
