package "ruby1.9.1-dev"

include_recipe "ruby_build"
include_recipe "rbenv::user"

include_recipe 'mysql::client'

include_recipe "nginx::source"
include_recipe "nginx::passenger"

# nginx virtual host configuration

template "#{node['nginx']['dir']}/sites-available/default" do
  source 'nginx/default-site.erb'
  owner  'root'
  group  'root'
  mode   0644
  notifies :reload, 'service[nginx]'
end

# logrotate for rails app

template "/etc/logrotate.d/rails_app" do
  source 'logrotate/rails_app.erb'
  owner  'root'
  group  'root'
  mode 0644
end

execute "change group #{node['user']['name']}" do
  command "chown #{node['user']['name']}:#{node['user']['name']} -R /home/#{node['user']['name']}/.rbenv/versions/#{node['rbenv']['user_installs'][0]['global']}"
  action :run
  only_if do File.exists?("/home/#{node['user']['name']}/.rbenv/versions/#{node['rbenv']['user_installs'][0]['global']}") end
end

execute "fix permissions - rbenv folder" do
  command "chmod -R 755 /home/#{node['user']['name']}/.rbenv/versions/#{node['rbenv']['user_installs'][0]['global']}"
  action :run
  only_if do File.exists?("/home/#{node['user']['name']}/.rbenv/versions/#{node['rbenv']['user_installs'][0]['global']}") end
end
