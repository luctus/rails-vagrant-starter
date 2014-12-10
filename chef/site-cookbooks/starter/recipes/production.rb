package "libmysqlclient-dev"

# creates /var/www/vhosts

directory node[:app][:nginx][:vhosts_dir] do
  mode 0777
  owner node[:app][:nginx][:user]
  group node[:app][:nginx][:user]
  action :create
  recursive true
end
