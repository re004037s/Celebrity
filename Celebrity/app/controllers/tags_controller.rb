class TagsController < ApplicationController


def tag_edit
 
    @tags  = Tag.all
    
    # send_data(@tags.icon)
  end
  
  def icon_show
   
    # @user = current_user
    # tag = @user.tags.create(tag: user_params[:tags])
    # tag_name = user_params[:tags]
    
    　icon = tag_params[:icon]

      if upload_icon.save
        flash[:success] = 'iconを保存しました！'
        redirect_to tag_edit_path
         
      else
        flash[:error] = 'iconの保存に失敗しました！'
        redirect_to tag_edit_path
      end
    end
end
# end