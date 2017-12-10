# パスの設定
env :PATH, ENV['PATH']

# Rails.rootを使用するために必要
require File.expand_path(File.dirname(__FILE__) + "/environment")

# cronを実行する環境変数
rails_env = ENV['RAILS_ENV'] || :development

# cronを実行する環境変数をセット
set :environment, rails_env

# cronのログの吐き出し場所
set :output, "#{Rails.root}/log/cron.log"

# 完了予定日を過ぎた学習項目のアラートメール
every 2.minutes do
  rake "mail:deadline_alert"
end


