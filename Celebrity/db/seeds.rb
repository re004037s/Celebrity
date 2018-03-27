# MovieCategoryテーブル
MovieCategory.create!(name: 'はじめに',               sort_order: 1, must_view: true, venture_movie: false, free_engineer_movie: true)
MovieCategory.create!(name: 'フリーエンジニアとは',   sort_order: 2, must_view: true, venture_movie: false, free_engineer_movie: true)
MovieCategory.create!(name: 'できるエンジニアになる', sort_order: 3, must_view: true, venture_movie: false, free_engineer_movie: true)
MovieCategory.create!(name: '就活編',                 sort_order: 4, must_view: true, venture_movie: false, free_engineer_movie: true)
MovieCategory.create!(name: 'プログラム学習編',       sort_order: 5, must_view: true, venture_movie: false, free_engineer_movie: true)
MovieCategory.create!(name: '起業とは',               sort_order: 6, must_view: true, venture_movie: true, free_engineer_movie: false)

# Movieテーブル
Movie.create!(title: 'まずはじめに',
              path: 'https://www.youtube.com/embed/9_631aHH1DM',
              movie_category_id: 1, sort_order: 1)
Movie.create!(title: 'フリーランスになるまでの1年計画',
              path: 'https://www.youtube.com/embed/-kkfQjqY348',
              movie_category_id: 1, sort_order: 2)
Movie.create!(title: 'フリーランスエンジニアなった方がいい理由',
              path: 'https://www.youtube.com/embed/ThaP8mxsmjs',
              movie_category_id: 2, sort_order: 1)
Movie.create!(title: '短期間のプログラミング学習で月収50万円の理由',
              path: 'https://www.youtube.com/embed/lj_PJMauzNU',
              movie_category_id: 2, sort_order: 2)
Movie.create!(title: 'PDCA(1)',
              path: 'https://www.youtube.com/embed/SyaeXhA9jAY',
              movie_category_id: 3, sort_order: 1)
Movie.create!(title: 'PDCA(2)',
              path: 'https://www.youtube.com/embed/JFb4WMnQerk',
              movie_category_id: 3, sort_order: 2)
Movie.create!(title: '作業速度を5倍にする方法',
              path: 'https://www.youtube.com/embed/fdpAKUc5-_c',
              movie_category_id: 3, sort_order: 3)
Movie.create!(title: '正しい会社の辞め方',
              path: 'https://www.youtube.com/embed/DX6vxAqafEM',
              movie_category_id: 4, sort_order: 1)
Movie.create!(title: '正しい転職活動',
              path: 'https://www.youtube.com/embed/zJYYX-IPCsM',
              movie_category_id: 4, sort_order: 2)
Movie.create!(title: 'インフラ系と開発系の違い',
              path: 'https://www.youtube.com/embed/Il2UQ6oyRBM',
              movie_category_id: 4, sort_order: 3)
Movie.create!(title: 'プログラミング勉強法',
              path: 'https://www.youtube.com/embed/asUe-__w3o0',
              movie_category_id: 5, sort_order: 1)
Movie.create!(title: 'Cloud9の登録方法',
              path: 'https://www.youtube.com/embed/dXUol31KHRc',
              movie_category_id: 5, sort_order: 2)
Movie.create!(title: 'GitHub講習(1)',
              path: 'https://www.youtube.com/embed/3m2tooSBUmw',
              movie_category_id: 5, sort_order: 3)
Movie.create!(title: 'GitHub講習(2)',
              path: 'https://www.youtube.com/embed/gD4idgDVJGI',
              movie_category_id: 5, sort_order: 4)
Movie.create!(title: 'GitHub講習(3)',
              path: 'https://www.youtube.com/embed/90YxMvftJPI',
              movie_category_id: 5, sort_order: 5)
Movie.create!(title: 'プログラミング演習',
              path: 'https://www.youtube.com/embed/K2FRGtAk6p8',
              movie_category_id: 5, sort_order: 6)
Movie.create!(title: '月商800万の女性起業家にインタビュー',
              path: 'https://www.youtube.com/embed/AlOWowUxZw8',
              movie_category_id: 6, sort_order: 1)

# Admin user
User.create(name: '鈴木 一郎',
            nickname: 'イチロー',
            email: 'ichiro@gmail.com',
            password: 'password',
            password_confirmation: 'password',
            admin: true,
            existence: true,
            line_id: 12345)
            
# 一般 user
User.create(name: '松井 秀喜',
            nickname: 'ゴジラ',
            email: 'hideki@gmail.com',
            password: 'password',
            password_confirmation: 'password',
            admin: false,
            existence: true,
            line_id: 67890,
            venture_user: true,
            free_engineer_user: false)

# 一般 user
User.create(name: '大谷 翔平',
            nickname: '二刀流',
            email: 'otani@gmail.com',
            password: 'password',
            password_confirmation: 'password',
            admin: false,
            existence: true,
            line_id: 98765,
            venture_user: false,
            free_engineer_user: true)
            
# 一般 user
User.create(name: 'ベーブルース',
            nickname: 'ベビーフェイス',
            email: 'baby@gmail.com',
            password: 'password',
            password_confirmation: 'password',
            admin: false,
            existence: true,
            line_id: 43210,
            venture_user: true,
            free_engineer_user: true)
            
# 一般 user
User.create(name: '松坂 大輔',
            nickname: '平成の怪物',
            email: 'matsu@gmail.com',
            password: 'password',
            password_confirmation: 'password',
            admin: false,
            existence: true,
            line_id: 12345,
            venture_user: true,
            free_engineer_user: true)

User.where(id: 1..4).each do |user|
    HtmlCssStatus.create(user_id: user.id)
    JavascriptStatus.create(user_id: user.id)
    RubyStatus.create(user_id: user.id)
    RubyonrailsStatus.create(user_id: user.id)
    RailstutorialStatus.create(user_id: user.id)
    UserMovieStatus.create(user_id: user.id)
end 

User.where(id: 5).each do |user|
    for i in 1..Movie.where(movie_category_id: MovieCategory.where(must_view: true).where(free_engineer_movie: true).ids).count
    Feedback.create(feedback: 'a'*100, movie_id: i, user_id: user.id)
    end
    HtmlCssStatus.create(user_id: user.id, ga_beginner: true, ga_middle: true, ga_advanced: true,
      do_beginner: true, do_middle: true, do_advanced: true, ji_1: true, ji_2: true, schedule_date: '2019-01-01')
    JavascriptStatus.create(user_id: user.id, ga_1: true,  ga_2: true, ga_3: true, ga_4: true, do_1: true, schedule_date: '2019-01-01')
    RubyStatus.create(user_id: user.id, ga_1: true,  ga_2: true, ga_3: true, ga_4: true, ga_5: true, schedule_date: '2019-01-01')
    RubyonrailsStatus.create(user_id: user.id, ga_1: true, ga_2: true, ga_3: true, ga_4: true, ga_5: true, ga_6: true, ga_7: true,
      ga_8: true, ga_9: true, ga_10: true, ga_11: true, do_1: true, do_2: true, do_3: true, do_4: true, schedule_date: '2019-01-01')
    RailstutorialStatus.create(user_id: user.id, chapter1: true, chapter2: true, chapter3: true, chapter4: true, chapter5: true,
      chapter6: true, chapter7: true, chapter8: true, chapter9: true, chapter10: true, chapter11: true, chapter12: true,
      chapter13: true, chapter14: true, schedule_date: '2019-01-01')
    UserMovieStatus.create(user_id: user.id, schedule_date: '2019-01-01')
end
