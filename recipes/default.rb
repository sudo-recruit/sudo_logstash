bash 'wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -' do
  code 'wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -'
end

bash 'echo "deb http://packages.elastic.co/logstash/2.3/debian stable main" | sudo tee -a /etc/apt/sources.list' do
  code 'echo "deb http://packages.elastic.co/logstash/2.3/debian stable main" | sudo tee -a /etc/apt/sources.list'
end

include_recipe "apt"
include_recipe "java::default"

package 'curl'
package 'git'
package 'vim'
package 'zip'

execute 'apt-get update' do
  command 'apt-get update'
end

package 'logstash'

template "/etc/logstash/conf.d/http.conf" do
  owner "root"
  group "root"
  mode "0777"
  source "logstash.conf.erb"
end

execute 'restart logstash' do
  command 'service logstash restart'
  user "root"
  group "root"
end