require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Celebrity
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.active_record.default_timezone = :local
    config.time_zone = 'Tokyo'
    # 認証トークンをremoteフォームに埋め込む
    config.action_view.embed_authenticity_token_in_remote_forms = true
    config.autoload_paths += Dir[Rails.root.join('app', 'uploaders')]
    config.autoload_paths += %W(#{config.root}/lib)
    config.enable_dependency_loading = true
    config.i18n.default_locale = :ja
    
    # add assets_paths（アセットパスの追加）
    config.assets.paths << config.root.join('node_modules')

    config.generators do |g|
      g.test_framework :rspec,
      fixtures: false, #テストデータベースにレコードを作成するファイルの作成をスキップ(factoryを使うため)
      view_specs: false, #フィーチャースペックを使うのでビュースペックを作成しないことを指定
      routing_specs: false #ルーティングのスペックを作成しないことを指定
    end
  end
end
