# encoding: utf-8
#上記の様にマジックコメントを書かないとatomの場合errorがでるので記述

FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "test#{n}" }
    sequence(:nickname) { |n| "test#{n}ちゃん"}
    sequence(:email) { |n|  "test#{n}@example.com"}
    sequence(:line_id) { |n| "test_#{n}"}
    password_digest "hidehide0120"
  end
end
