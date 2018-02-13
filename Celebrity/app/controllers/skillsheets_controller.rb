class SkillsheetsController < ApplicationController
  
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
  
  
  def new
  end
  
  def show
    @users = User.page(params[:page])
  end

  def create
    @skillsheet = Skillsheet.new(skillsheet_paprams)
    @skillsheet.name = params[:skillsheet][:excel].original_filename
    @skillsheet.picture = params[:skillsheet][:excel].read

    if @skillsheet.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

    def skillsheet_paprams
      params.require(:image).permit(:name, :picture)
    end

end
