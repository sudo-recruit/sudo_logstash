name "sudo_logstash"
version "0.0.1"
maintainer "ocowchun"
maintainer_email "ben.yeh@sudo.com.tw"
license  "MIT"
supports "ubuntu"
description "install logstash"
long_description IO.read(File.join(File.dirname(__FILE__), "README.md"))


depends 'java', '~> 1.39.0'
depends 'apt', '~> 3.0.0'


