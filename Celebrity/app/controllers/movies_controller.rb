class MoviesController < ApplicationController
  before_action :set_categories, only: [:new, :edit]

  def index
    @movies = Movie.all.sort_by {|m| [m.movie_category.sort_order, m.sort_order] }
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
    if @movie.update_attributes(movie_params)
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