class MoviesController < ApplicationController
  before_action :set_categories, only: [:new, :edit]

  def index
    @categories = MovieCategory.all.order('sort_order')
  end

  def new
    @movie = Movie.new
  end
  
  def create
    params[:movie][:sort_order] = Movie.where(movie_category_id: params[:movie][:movie_category_id]).pluck(:sort_order).max.to_i + 1
    @movie = Movie.new(movie_params)
    if @movie.save
      flash[:success] = '動画を登録しました'
      redirect_to movies_path
    else
      flash.now[:danger] = '登録に失敗しました。もう一度お試しください。'
      render 'new'
    end
  end
  
  def edit
    @movie = Movie.find_by(id: params[:id])
  end
  
  def update
    @movie = Movie.find_by(id: params[:id])
    before_update_category_id = @movie.movie_category_id
    before_update_sort_order  = @movie.sort_order
    params[:movie][:sort_order] = Movie.where(movie_category_id: params[:movie][:movie_category_id]).pluck(:sort_order).max.to_i + 1
    
    if @movie.update_attributes(movie_params)
      # カテゴリが変更された場合
      if before_update_category_id != @movie.movie_category_id
        Movie.where(movie_category_id: before_update_category_id).where(['sort_order > ?', before_update_sort_order]).try(:each) do |m|
          m.update_attributes(sort_order: m.sort_order - 1)
        end
      end
      flash[:success] = '動画情報を更新しました' 
      redirect_to movies_path
    else
      render 'edit'
    end
  end

  def destroy
    @movie = Movie.find_by(id: params[:id])
    if @movie.destroy  # 論理削除
      Movie.where(movie_category_id: @movie.movie_category_id).where(['sort_order > ?', @movie.sort_order]).try(:each) do |m|
        m.update_attributes(sort_order: m.sort_order - 1)
      end
      flash[:success] = '動画を削除しました'
      redirect_to movies_path
    end
  end

  def sort
    @category_movies = Movie.where(movie_category_id: params[:category_id])
    sort_num = params[:sort_up].present? ? params[:sort_up].to_i : params[:sort_down].to_i

    if params[:sort_up].present?
      @sort_up_movie   = @category_movies.find_by(sort_order: sort_num)
      @sort_down_movie = @category_movies.find_by(sort_order: sort_num - 1)
  
      @sort_up_movie.update_attributes(sort_order: sort_num - 1)
      @sort_down_movie.update_attributes(sort_order: sort_num)

    else
      @sort_up_movie   = @category_movies.find_by(sort_order: sort_num + 1)
      @sort_down_movie = @category_movies.find_by(sort_order: sort_num)
  
      @sort_up_movie.update_attributes(sort_order: sort_num)
      @sort_down_movie.update_attributes(sort_order: sort_num + 1)
    end

    @movies = Movie.where(movie_category_id: params[:category_id]).order('sort_order')
    @movie_category = MovieCategory.find_by(id: params[:category_id])
 
    respond_to do |format|
      format.html { redirect_to edit_movie_url }
      format.js
    end
  end
  
  private
  
    def movie_params
      params.require(:movie).permit(:title, :path, :movie_category_id, :sort_order)
    end
    
    def set_categories
      @categories = {}
      cate   = MovieCategory.all
      cate.each do |c|
        @categories.merge!(c.name => c.id)
      end
    end
end