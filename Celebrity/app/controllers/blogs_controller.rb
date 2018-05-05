class BlogsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]
  
  def new
    @blog = Blog.new
  end
  
  def create
    @blog = Blog.new(blog_params)
    if @blog.save 
      flash[:success] = "Blogが投稿されました"
      redirect_to blogs_path
    else
      Rails.logger.info(@blog.errors.inspect)
      flash[:danger] = "Blogの投稿ができませんでした"
      render 'new'
    end
  end
  
  def index
    @blogs = Blog.all.page(params[:page]).order('id')
  end
  
  def show
    @blog = Blog.find(params[:id])
  end
  
  def edit
    @blog = Blog.find(params[:id])
  end
  
  def update
    @blog = Blog.find(params[:id])
    if @blog.update_attributes(blog_params)
      flash[:success] = "Blogが更新されました"
      redirect_to blogs_path
    else
      Rails.logger.info(@blog.errors.inspect)
      flash[:danger] = "Blogの更新ができませんでした"
      render 'edit'
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    flash[:success] = "Blogが削除されました"
    redirect_to blogs_path
  end
  
  private
    def blog_params
      params.require(:blog).permit(:title, :body, :thumbnail, :user_id)
    end
end
