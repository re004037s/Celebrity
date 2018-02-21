class SkillsheetsController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :edit, :update]
  before_action :correct_user, only: [:show, :edit, :update]
  before_action :existence_user, only: [:show, :edit, :update]
  before_action :administrator_user, only: :new
  
  def index
    @user = current_user
    @users = User.page(params[:page])
    logger.fatal("errrrrrorr")
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
      skillsheet_name = params[:user][:file].original_filename
      if current_user.update_columns(skillsheet: encoded_skillsheet, skillsheet_name: skillsheet_name)
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
      :filename => @user.skillsheet_name 
    )
  end
  
  def new
  end
  
  def show
    @users = User.page(params[:page])
  end

  def create
  end

  private

    
    def skillsheet_params

      params.require(:user).permit(:name, :nickname, :file)

    end
end
