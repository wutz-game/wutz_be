# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
# Example:
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end
# Learn more: http://github.com/javan/whenever

#Sets output log
set :output, "log/cron.log"

#Sets bundle path
# set :bundle_command, "/Users/ianlyell/.rbenv/shims/bundle exec"

#Creates a new daily game in the DB at 1:00 AM everyday.
every 1.minute do
    rake "daily_game:create_daily_game", :environment => "production"
end