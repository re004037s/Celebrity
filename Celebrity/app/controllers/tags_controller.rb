class TagsController < ApplicationController
  protect_from_forgery :except => [:update_tag]
  before_action :admin_user

  def tag_edit
    @tags  = Tag.all.order(id: "ASC")
  end
  
  def update_tag
    
    # js ajax request case
    if params[:color]
      new_color = params[:color]
      tag_id = params[:tag_id]
      @tag = Tag.find_by(id: tag_id)
      # TODO ajax がhtmlサイドに帰らないため暫定処置
      if @tag.update_columns(color: new_color)
        redirect_to tag_edit_path
      else
        redirect_to tag_edit_path
      end
      
    end

  end

  def icon_show
   
    
    　upload_icon = params[:icon]

      if @tag.update_columns(icon: upload_icon.read)
        flash[:success] = 'iconを保存しました！'
        redirect_to tag_edit_path
         
      else
        flash[:error] = 'iconの保存に失敗しました！'
        redirect_to tag_edit_path
      end
    end
end
# end