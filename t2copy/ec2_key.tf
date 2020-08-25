provider "aws" {
region = "ap-south-1"
profile = "abhi"
}



resource "aws_key_pair" "deployer" {
  key_name   = "terrkey"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDzIc4J8R/kk2VegmZ+Hh7Ax2RGapK/7DtSX5FgNkrZSZyp5LFFJFhBXYefAtBhvSznuPTvTfW3Zv6kJ7cQsa2XaNi6/yru6FjQ/SbUAP6YlQ8uTccrCWxjVStURlZovq6pH5aXisRYsre57sUpqE8jrh+uKIgaBzboMROT0fEgGCtgOH+Di6rYlhvAw1BD5hy+UBRcWSf9wjOtT0NLkf+hL0a63uuBcWQq9km3grWAZwMYgU4qSlSXRARJ6RfFXAUq1AwPhNd5/d7YdQCg/WlmJJuzwPfmsEDKGlsUpPUOopxiFwNBqYoYV5L1XHgLOZ8Q4dAVSaQM1Xm/tynkRhKt"
}
