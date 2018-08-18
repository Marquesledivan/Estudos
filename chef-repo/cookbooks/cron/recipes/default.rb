cron 'chef-client' do
  action :create
  minute '*-5'
  hour '*'
  weekday '*'
  command '/usr/bin/chef-client'
end
