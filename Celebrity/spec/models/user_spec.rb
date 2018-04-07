# encoding: utf-8
#上記の様にマジックコメントを書かないとatomの場合errorがでるので記述

require 'rails_helper'

RSpec.describe User, type: :model do
  # FactoryBotで作ったuserをletでメモ化
  let(:user)  { FactoryBot.build(:user) }


  specify "FactoryBotで作ったuserが有効であること" do
    expect(user).to be_valid
  end

  %w{name nickname email line_id password_digest}.each do |column_user|
    specify "#{column_user}は空であってはならない" do
      user[column_user] = ""
      expect(user).not_to be_valid
      expect(user.errors[column_user]).to be_present
    end
  end

  %w{name nickname}.each do |column_name|
    specify "#{column_name}は10文字以内" do
      user[column_name] = "あ" * 11
      expect(user).not_to be_valid
      expect(user.errors[column_name]).to be_present
    end
  end
end
