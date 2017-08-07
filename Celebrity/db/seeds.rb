# 1.管理ユーザ かつ ポートフォリオあり
User.create!(name: '鈴木 一朗',
          nickname: 'イチロー',
          email: 'ichiro@gmail.com',
          password: 'password',
          password_confirmation: 'password',
          admin: true,
          existence: true,
          portfolio_path: 'https://marubozu.herokuapp.com')

# 2.一般ユーザ かつ 勉強進度：0% かつ 視聴完了(感想送信)率：0%
User.create!(name: '松井 秀喜',
          nickname: 'ゴジラ',
          email: 'matsui@gmail.com',
          password: 'password',
          password_confirmation: 'password',
          admin: false,
          existence: true,
          portfolio_path: '')

# 3.一般ユーザ かつ 削除済み
User.create!(name: '中村 剛也',
          nickname: 'おかわり',
          email: 'nakamura@gmail.com',
          password: 'password',
          password_confirmation: 'password',
          admin: false,
          existence: false,
          portfolio_path: '')

# 4.一般ユーザ & 勉強進度：50% & 視聴完了(感想送信)率：50% & Tutorial：7章完了
#
User.create!(name: '山田 哲人',
          nickname: 'ヤマダ',
          email: 'yamada@gmail.com',
          password: 'password',
          password_confirmation: 'password',
          admin: false,
          existence: true,
          portfolio_path: '')

user4 = User.find_by(email: 'yamada@gmail.com')
HtmlCssStatus.create!(ga_beginner: true, ga_middle: true, ga_advanced: true,
                      do_beginner: true, do_middle: true, do_advanced: true,
                      ji_1: true, ji_2: true, user_id: '4')

JavascriptStatus.create!(ga_beginner: true, do_beginner: true, user_id: '4')
RubyStatus.create!(ga_1: true, ga_2: true, ga_3: true, ga_4: true, ga_5: true, user_id: '4')

RailstutorialStatus.create!(chapter1: true, chapter2: true, chapter3: true, chapter4: true,
                            chapter5: true, chapter6: true, chapter7: true, chapter8: false,
                            chapter9: false, chapter10: false, chapter11: false, chapter12: false,
                            chapter13: false, chapter14: false, user_id: '4')

user4.feedbacks.create!(movie_id: '1', feedback: '面白かった' * 50 )
user4.feedbacks.create!(movie_id: '2', feedback: 'すごかった' * 50 )

# 5.一般ユーザ & 勉強進度：100% & 視聴完了(感想送信)率：100% & Tutorial：14章完了
User.create!(name: '大谷 翔平',
          nickname: 'ショーヘイ',
          email: 'otani@gmail.com',
          password: 'password',
          password_confirmation: 'password',
          admin: false,
          existence: true,
          portfolio_path: '')
          
user5 = User.find_by(email: 'otani@gmail.com')
HtmlCssStatus.create!(ga_beginner: true, ga_middle: true, ga_advanced: true,
                              do_beginner: true, do_middle: true, do_advanced: true,
                              ji_1: true, ji_2: true, user_id: '5')

JavascriptStatus.create!(ga_beginner: true, do_beginner: true, user_id: '5')
RubyStatus.create!(ga_1: true, ga_2: true, ga_3: true, ga_4: true, ga_5: true, user_id: '5')
RubyonrailsStatus.create!(ga_1: true, ga_2: true, ga_3: true, ga_4: true, ga_5: true,
                          ga_6: true, ga_7: true, ga_8: true, ga_9: true, ga_10: true,
                          ga_11: true, do_1: true, do_2: true, do_3: true, do_4: true, user_id: '5')

RailstutorialStatus.create!(chapter1: true, chapter2: true, chapter3: true, chapter4: true,
                            chapter5: true, chapter6: true, chapter7: true, chapter8: true,
                            chapter9: true, chapter10: true, chapter11: true, chapter12: true,
                            chapter13: true, chapter14: true, user_id: '5')

user5.feedbacks.create!(movie_id: '1', feedback: '面白かった' * 50 )
user5.feedbacks.create!(movie_id: '2', feedback: 'すごかった' * 50 )
user5.feedbacks.create!(movie_id: '3', feedback: '寝てしまった' * 50 )
user5.feedbacks.create!(movie_id: '4', feedback: 'よかった' * 50 )

# 一般ユーザ×50
50.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@gmail.com"
  password = 'password'
  User.create!(name: name,
              nickname: name,
              email: email,
              password: password,
              password_confirmation: password,
              admin: false,
              existence: true,
              portfolio_path: '')
end

# Movieテーブル
Movie.create!(title: 'なぜプログラムを勉強したら短期間で月収50万円になれるのか？',
              path: 'ttps://www.youtube.com/embed/lj_PJMauzNU?list=UUV_bOyaNKyzKX6fnRlcu4UA')
Movie.create!(title: '挫折しない！プログラミング入門その１',
              path: 'https://www.youtube.com/embed/B-IQt9NXb5A')
Movie.create!(title: '貧乏人の特徴',
              path: 'https://www.youtube.com/watch?v=37XxB1Mzk6U')
Movie.create!(title: 'こまっちゃんの生い立ち',
              path: 'https://www.youtube.com/watch?v=vfSiZ5y-79Y')