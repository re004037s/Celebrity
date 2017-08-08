#ユーザー作成
User.create!(name:  "admin",
             nickname:  "admin_nickname",
             email: "admin@admin.com",
             password:              "admin_pass",
             password_confirmation: "admin_pass",
             created_at: Time.zone.now,
             admin:     true)
 
30.times do |n|
  name  = Faker::Name.name,
  nickname = "user#{n+1}_nickname",
  email = "user#{n+1}@user#{n+1}.org",
  password = "password",
  admin = false
  
  User.create!(name:  name,
              nickname: nickname,
              email: email,
              password:              password,
              password_confirmation: password,
              created_at: Time.zone.now,
              admin: admin)

end