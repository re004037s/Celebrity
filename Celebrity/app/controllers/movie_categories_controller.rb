class MovieCategoriesController < ApplicationController

  def index
    @categories = MovieCategory.all.order('sort_order')
  end

  def show
    @movies         = Movie.where(movie_category_id: params[:id]).order('sort_order')
    @category       = MovieCategory.find_by(id: params[:id])
    @categories_all = MovieCategory.all.order('sort_order')
  end

  def new
    @movie_category = MovieCategory.new
  end
  
  def create
    params[:movie_category][:sort_order] = MovieCategory.all.pluck(:sort_order).max.to_i + 1
    @movie_category = MovieCategory.new(movie_category_params)
    if @movie_category.save
      flash[:success] = '動画カテゴリを登録しました'
      redirect_to movies_path
    else
      flash.now[:danger] = '登録に失敗しました。もう一度お試しください。'
      render 'new'
    end
  end
  
  def edit
    @movie_category = MovieCategory.find_by(id: params[:id])
    @movies = Movie.where(movie_category_id: params[:id]).order('sort_order')
  end
  
  def update
    @movie_category = MovieCategory.find_by(id: params[:id])
    if @movie_category.update_attributes(movie_category_params)
      flash[:success] = '動画カテゴリ情報を更新しました' 
      redirect_to movies_path
    else
      render 'edit'
    end
  end

  def destroy
    @movie_category = MovieCategory.find_by(id: params[:id])
    @movie_category.update_attributes(sort_order: 0)
    if @movie_category.destroy  # 論理削除
      MovieCategory.where(['sort_order > ?', @movie_category.sort_ordert]).try(:each) do |mc|
        mc.update_attributes(sort_order: mc.sort_order - 1)
      end
      flash[:success] = '動画カテゴリを削除しました'
      redirect_to movies_path
    end
  end
  
  def sort
    @categories = MovieCategory.all
    sort_num = params[:sort_up].present? ? params[:sort_up].to_i : params[:sort_down].to_i

    if params[:sort_up].present?
      @sort_up_category   = @categories.find_by(sort_order: sort_num)
      @sort_down_category = @categories.find_by(sort_order: sort_num - 1)
  
      @sort_up_category.update_attributes(sort_order: sort_num - 1)
      @sort_down_category.update_attributes(sort_order: sort_num)

    else
      @sort_up_category   = @categories.find_by(sort_order: sort_num + 1)
      @sort_down_category = @categories.find_by(sort_order: sort_num)
  
      @sort_up_category.update_attributes(sort_order: sort_num)
      @sort_down_category.update_attributes(sort_order: sort_num + 1)
    end

    @categories = MovieCategory.all.order('sort_order')
 
    respond_to do |format|
      format.html { redirect_to edit_movie_url }
      format.js
    end
  end

  private
  
    def movie_category_params
      params.require(:movie_category).permit(:name, :sort_order)
    end
end