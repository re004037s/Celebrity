class SkillsheetsController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :edit, :update]
  before_action :correct_user, only: [:show, :edit, :update]
  before_action :existence_user, only: [:show, :edit, :update]
  before_action :administrator_user, only: :new
  
  def index
    @user = current_user
    @existed_normal_users = User.page(params[:page]).select{ |u| u.existence == true && u.guest == false }
    @statuses = {'未登録':1, '就業中':2, '営業中':3}
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
    @user = User.find(params[:user_id])
    send_data(
      @user.skillsheet,
      :type => 'application/excel',
      :filename => @user.skillsheet_name 
    )
  end
  
  
  def update_business_status
    # paramsの中にstatusが入っています。
    # paramsの中にuser.idがないので、view側でhiddenタグを使って、user.idを送信してください。
    
    # 該当カラムの値をupdateしてください
    # 成功した場合はindex.htmlにページ遷移する
    # 失敗した場合はindex.htmlをrenderする（たぶん）
  end

  private

    
    def skillsheet_params

      params.require(:user).permit(:name, :nickname, :file, statuses:[])

    end
end
