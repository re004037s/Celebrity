# 1.管理ユーザ
User.first_or_create!(name: '小松　一樹',
          nickname: 'こまっちゃん',
          email: 'ichiro@gmail.com',
          password: 'password',
          password_confirmation: 'password',
          admin: true,
          existence: true)

# Movieテーブル
Movie.first_or_create!(title: 'まずはじめに',
              path: 'https://www.youtube.com/embed/9_631aHH1DM')
Movie.first_or_create!(title: 'フリーランスになるまでの1年計画',
              path: 'https://www.youtube.com/embed/-kkfQjqY348')
Movie.first_or_create!(title: 'フリーランスエンジニアなった方がいい理由',
              path: 'https://www.youtube.com/embed/ThaP8mxsmjs')
Movie.first_or_create!(title: 'なぜプログラミングを勉強したら短期間で月収50万円になれるのか？',
              path: 'https://www.youtube.com/embed/lj_PJMauzNU')
Movie.first_or_create!(title: 'PDCA(1)',
              path: 'https://www.youtube.com/embed/SyaeXhA9jAY')
Movie.first_or_create!(title: 'PDCA(2)',
              path: 'https://www.youtube.com/embed/JFb4WMnQerk')
Movie.first_or_create!(title: '作業速度を5倍にする方法',
              path: 'https://www.youtube.com/embed/fdpAKUc5-_c')
Movie.first_or_create!(title: '報連相の重要性',
              path: 'https://www.youtube.com/embed/Hn_hfNDWXfA') #id=51
Movie.first_or_create!(title: '正しい会社の辞め方',
              path: 'https://www.youtube.com/embed/DX6vxAqafEM')
Movie.first_or_create!(title: '正しい転職活動',
              path: 'https://www.youtube.com/embed/zJYYX-IPCsM')
Movie.first_or_create!(title: 'インフラ系と開発系の違い',
              path: 'https://www.youtube.com/embed/Il2UQ6oyRBM')
Movie.first_or_create!(title: 'プログラミング勉強法',
              path: 'https://www.youtube.com/embed/asUe-__w3o0')
Movie.first_or_create!(title: 'ポートフォリオ作成のポイント',
              path: 'https://youtube.com/embed/UnwPmOROW2g') #id=33
Movie.first_or_create!(title: 'Cloud9の登録方法',
              path: 'https://www.youtube.com/embed/dXUol31KHRc')
Movie.first_or_create!(title: 'GitHub講習(1)',
              path: 'https://www.youtube.com/embed/3m2tooSBUmw')
Movie.first_or_create!(title: 'GitHub講習(2)',
              path: 'https://www.youtube.com/embed/gD4idgDVJGI')
Movie.first_or_create!(title: 'GitHub講習(3)',
              path: 'https://www.youtube.com/embed/90YxMvftJPI')
Movie.first_or_create!(title: 'プログラミング演習',
              path: 'https://www.youtube.com/embed/K2FRGtAk6p8')

