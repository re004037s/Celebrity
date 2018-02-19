class SkillsheetsController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :edit, :update]
  before_action :correct_user, only: [:show, :edit, :update]
  before_action :existence_user, only: [:show, :edit, :update]
  before_action :administrator_user, only: :new
  
  def index
    @user = current_user
    @users = User.page(params[:page])
  end
  
  def download
    Spreadsheet.client_encoding = "UTF-8"
    book = Spreadsheet.open Rails.root.join('excel', 'sample.xls').to_path
    data = StringIO.new ''
    book.write data
    send_data(
      data.string,
      :type => 'application/excel',
      :filename => 'スキルシート(sample).xls'
    )
  end
  
  def update_skillsheet
    
    unless params[:user].try(:[],:file) == nil
      upload_skillsheet = skillsheet_params[:file]
      encoded_skillsheet = upload_skillsheet.read.force_encoding("UTF-8")
       if current_user.update_columns(skillsheet: encoded_skillsheet)
          flash[:success] = 'ファイルを保存しました！'
          redirect_to skillsheets_path
         else
          flash[:error] = 'ファイルの保存に失敗しました！'
          redirect_to skillsheets_path
       end
    end
  end
  
  def get_skillsheet
     @user = current_user
     send_data(
       @user.skillsheet,
       :type => 'application/excel',
       
       #skillsheet.xlsとしているが、アップロード時に格納したファイル名を変数で取得し代入すべき。
       #アップロードファイルの拡張子と下記の固定値の拡張子が異なる場合エラーになる。
       :filename => 'skillsheet.xls' 
     )
  end

  def create
  end

  private

    
    def skillsheet_params

      params.require(:user).permit(:name, :nickname, :file)

    end
end
