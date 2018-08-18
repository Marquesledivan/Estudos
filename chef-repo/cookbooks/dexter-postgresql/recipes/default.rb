package 'postgresql-server' do
  action :install
end

DataDir = "/var/lib/pgsql/data/pg_log"
if not File.exists? DataDir then
   execute "postgresql-init" do
   command "/usr/bin/postgresql-setup initdb"
   end
end

cookbook_file '/var/lib/pgsql/data/postgresql.conf' do
  source 'postgresql.conf'
  owner 'postgres'
  group 'postgres'
  mode '0600'
  notifies :restart, 'service[postgresql]', :immediately
end

cookbook_file '/var/lib/pgsql/data/pg_hba.conf' do
  source 'pg_hba.conf'
  owner 'postgres'
  group 'postgres'
  mode '0600'
  notifies :restart, 'service[postgresql]', :immediately
end

cookbook_file '/tmp/postgres.initial.sql' do
  source 'postgres.initial.sql'
  owner 'postgres'
  group 'postgres'
  mode '0644'
end

cookbook_file '/var/lib/pgsql/postgresql_create.sh' do
  source 'postgresql_create.sh'
  owner 'postgres'
  group 'postgres'
  mode '0755'
end

service 'postgresql' do
  action [:enable, :start]
end

bash "postgres_user_database_create" do
  code <<-EOC
    su - postgres -c "bash postgresql_create.sh"
  EOC
  not_if "su - postgres -c 'psql roundcubemail'"
end
