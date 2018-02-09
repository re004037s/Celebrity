class SkillsheetController < ApplicationController
  
  def index
    @iuser = current_user
  end
  
  
  def new
    @skillsheet = Skillsheet.new
    @skillsheet.name = ""
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
