class SkillsheetsController < ApplicationController
  
  def index
    @users = User.page(params[:page])
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
