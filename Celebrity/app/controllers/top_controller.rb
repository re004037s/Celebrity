class TopController < ApplicationController
  before_action :set_movie_categories, only: [:index]
  
  def index
  end
  
  private
  
    def set_movie_categories
      @categories_all = MovieCategory.all
    end
end