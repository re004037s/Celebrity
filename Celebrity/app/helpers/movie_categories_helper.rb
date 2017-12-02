module MovieCategoriesHelper
  def before_category_comp?(category)
    if category.sort_order == 1 || !MovieCategory.find_by(sort_order: category.sort_order - 1).must_view || !MovieCategory.find_by(sort_order: category.sort_order).must_view
      return true
    end
    target_movie_ids = MovieCategory.find_by(sort_order: category.sort_order - 1).movies.pluck(:id)
    sent_movie_ids   = current_user.feedbacks.pluck(:movie_id)
    target_movie_ids.each do |id|
      return false unless sent_movie_ids.include?(id)
    end
    return true
  end
  
  def send_feedbacks_comp?
    sent_movie_ids = current_user.feedbacks.pluck(:movie_id)
    last_category = MovieCategory.find_by(sort_order:  MovieCategory.count)
    return false if last_category.nil?
    if last_category.try(:movies).present?
      last_movie_id = last_category.movies.order('sort_order').last.id
    else
      last_movie_id = MovieCategory.find_by(sort_order: MovieCategory.count - 1).movies.order('sort_order').last.id
    end

    return sent_movie_ids.include?(last_movie_id) ? true : false
  end
end