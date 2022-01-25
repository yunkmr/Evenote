# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:

# 絶対パスから相対パス指定
env :PATH, ENV['PATH']
# ログファイルの出力先
set :output, 'log/cron.log'
# ジョブの実行環境の指定
set :environment, :production
# set :environment, :environment
#
# set :output, "/path/to/my/cron_log.log"
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

# every 1.minutes do
every 1.days, at: '9:00 am' do

# Rails内のメソッド実行
  # runner "UserMailer.notify_user.deliver_now"

  runner "UserMailer.event_day_remind.deliver_now"
  runner "UserMailer.entry_start_day_remind.deliver_now"
  runner "UserMailer.entry_end_day_remind.deliver_now"
  runner "UserMailer.win_day_remind.deliver_now"
  runner "UserMailer.payment_day_remind.deliver_now"

end

# Learn more: http://github.com/javan/whenever
