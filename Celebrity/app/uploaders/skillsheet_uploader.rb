class SkillsheetUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  # process resize_to_limit: [100, 100]
  storage :file
  
  def default_url
    "default.xlsx"
  end

  # アップロードファイルの保存先ディレクトリは上書き可能
  # 下記はデフォルトの保存先  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # アップロード可能な拡張子のリスト
  def extension_white_list
    %w(xlsx xls xlsm )
  end
end