class TopController < ApplicationController
  require 'date'
  before_action :logged_in_user
  before_action :set_movie_categories, only: [:index]
  
  def index
    @new_movies = Movie.all.where(['created_at > ?', Date.today.prev_day(7)])
  end
  
  private
  
    def set_movie_categories
      @categories_all = MovieCategory.all.order('sort_order')
    end
end