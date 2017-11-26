module MovieCategoriesHelper
  def before_category_comp?(category)
    return true if category.sort_order == 1

    target_movie_ids = MovieCategory.find_by(sort_order: category.sort_order - 1).movies.pluck(:id)
    sent_movie_ids   = current_user.feedbacks.pluck(:movie_id)
    target_movie_ids.each do |id|
      return false unless sent_movie_ids.include?(id)
    end
    return true
  end
  
  def send_feedbacks_comp?
    sent_movie_ids = current_user.feedbacks.pluck(:movie_id)
    last_movie_id = MovieCategory.find_by(sort_order:  MovieCategory.count).movies.order('sort_order').last.id
    return sent_movie_ids.include?(last_movie_id) ? true : false
  end
end