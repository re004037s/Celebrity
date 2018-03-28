class DefectForm < ApplicationRecord
      attr_accessor :name, :mail, :type, :contants
      
  validates :name,   length: { minimum: 3, :too_short => '名前を入力して下さい。'}
  validates :email,  length: { minimum: 3, :too_short => 'メールアドレスを入力して下さい。'}
  validates_numericality_of :type, { :message => '種別を選択してください'}
  validates :contants, :presence => { :message => '不具合内容を入力して下さい。'}
      
      
end
