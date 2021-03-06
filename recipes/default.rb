#
# Author:: Sean Abrahams <abrahams@gmail.com>
# Cookbook Name:: opsworks-cron-jobs
# Recipe:: default
#
# Create custom cron jobs

cron_env = Marshal.load(Marshal.dump(node["deploy"]["PTM"]["environment_variables"].to_hash))
cron_env["PATH"] = "/usr/local/bin:$PATH"
node[:cron_jobs].each do |cron_values|
  cron "#{cron_values[:name]}" do
    environment cron_env
    minute "#{cron_values[:minute]}"
    hour "#{cron_values[:hour]}"
    day "#{cron_values[:day]}"
    month "#{cron_values[:month]}"
    weekday "#{cron_values[:weekday]}"
    command "#{cron_values[:command]}"
  end
end
