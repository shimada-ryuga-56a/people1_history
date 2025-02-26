require File.expand_path(File.dirname(__FILE__) + '/environment')

rails_env = ENV['RAILS_ENV'] || :development
set :environment, rails_env
set :output, "#{Rails.root}/log/cron.log"

every 1.minute do
  rake "job:process_link_view_records"
end

# Learn more: http://github.com/javan/whenever
