# MovieCategoryテーブル
MovieCategory.create!(name: 'はじめに',               sort_order: 1, must_view: true)
MovieCategory.create!(name: 'フリーエンジニアとは',   sort_order: 2, must_view: true)
MovieCategory.create!(name: 'できるエンジニアになる', sort_order: 3, must_view: true)
MovieCategory.create!(name: '就活編',                 sort_order: 4, must_view: true)
MovieCategory.create!(name: 'プログラム学習編',       sort_order: 5, must_view: true)

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
Movie.create!(title: 'なぜプログラミングを勉強したら短期間で月収50万円になれるのか？',
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

# Admin user
User.create(name: '鈴木 一郎',
            nickname: 'イチロー',
            email: 'ichiro@gmail.com',
            password: 'password',
            password_confirmation: 'password',
            admin: true,
            existence: true)
            
# 一般 user
User.create(name: '松井 秀喜',
            nickname: 'ゴジラ',
            email: 'hideki@gmail.com',
            password: 'password',
            password_confirmation: 'password',
            admin: false,
            existence: true)
            
User.create(name: 'サブロー',
            nickname: 'サブちゃん',
            email: 'saburo@gmail.com',
            password: 'password',
            password_confirmation: 'password',
            admin: false,
            existence: true)            

User.create(name: 'シロー',
            nickname: 'シロちゃん',
            email: 'siro@gmail.com',
            password: 'password',
            password_confirmation: 'password',
            admin: false,
            existence: true)            

User.create(name: 'ゴロー',
            nickname: 'ゴロちゃん',
            email: 'goro@gmail.com',
            password: 'password',
            password_confirmation: 'password',
            admin: false,
            existence: true)            

User.create(name: 'ロクロー',
            nickname: 'ロクちゃん',
            email: 'rokuro@gmail.com',
            password: 'password',
            password_confirmation: 'password',
            admin: false,
            existence: true)            
User.create(name: 'ナナロー',
            nickname: 'ナナちゃん',
            email: 'nanaro@gmail.com',
            password: 'password',
            password_confirmation: 'password',
            admin: false,
            existence: true)            
User.create(name: 'ハチロー',
            nickname: 'ハチちゃん',
            email: 'hachiro@gmail.com',
            password: 'password',
            password_confirmation: 'password',
            admin: false,
            existence: true)            

User.all.each do |user|
    HtmlCssStatus.create(user_id: user.id)
    JavascriptStatus.create(user_id: user.id)
    RubyStatus.create(user_id: user.id)
    RubyonrailsStatus.create(user_id: user.id)
    RailstutorialStatus.create(user_id: user.id)
    UserMovieStatus.create(user_id: user.id)
end 
