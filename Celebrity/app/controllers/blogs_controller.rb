class BlogsController < ApplicationController
  def new
    @post_blog = Blog.new
  end
  
  def create
    # @thumbnail = input_blog_params[:thumbnail]
    # if @thumbnail == nil 
    #   flash[:danger] = "画像がnil"
    #   redirect_to new_blog_path
    # end 
    @blog = Blog.new(input_blog_params)
    if @blog.save
      Rails.logger.info(@blog.errors.inspect)
      flash[:success] = "Blogの投稿ができました"
      redirect_to blogs_path
    else
      Rails.logger.info(@blog.errors.inspect)
      flash[:danger] = "Blogの投稿ができませんでした"
      redirect_to new_blog_path
    end
  end
  
  def index
    @blog = Blog.all
  end
  
  private
    def input_blog_params
      params.require(:blog).permit(:title, :body, :thumbnail)
    end
end
