module MovieCategoriesHelper
  
  # 全動画カテゴリの呼び出し
  def all_movie_categories
    MovieCategory.order('sort_order')
  end
  
  def free_movie_categories
    MovieCategory.where(subject: 'free').order('sort_order')
  end
  
  def venture_movie_categories
    MovieCategory.where(subject: 'venture').order('sort_order')
  end
  
  def staff_movie_categories
    MovieCategory.where(subject: 'staff').order('sort_order')
  end
  
  # 動画カテゴリ毎の閲覧状況を判定
  def before_category_comp?(category)
    if category.subject == 'free'
      if category.sort_order == 1
        return true
      end
      if !MovieCategory.find_by(sort_order: category.sort_order - 1).blank? &&
        !MovieCategory.find_by(sort_order: category.sort_order - 1).must_view
        return true
      end
      if !MovieCategory.find_by(sort_order: category.sort_order).blank? &&
        !MovieCategory.find_by(sort_order: category.sort_order).must_view
        return true
      end
      target_movie_ids = MovieCategory.find_by(sort_order: category.sort_order - 1).movies.pluck(:id)
      sent_movie_ids   = current_user.feedbacks.pluck(:movie_id)
      target_movie_ids.each do |id|
        return false unless sent_movie_ids.include?(id)
      end
      return true
    elsif category.subject == 'venture'
      if category.sort_order == MovieCategory.where(must_view: true).where(subject: 'venture').minimum(:sort_order)
        return true
      end
      if !MovieCategory.find_by(sort_order: category.sort_order - 1).blank? &&
        !MovieCategory.find_by(sort_order: category.sort_order - 1).must_view
        return true
      end
      if !MovieCategory.find_by(sort_order: category.sort_order).blank? &&
        !MovieCategory.find_by(sort_order: category.sort_order).must_view
        return true
      end
      target_movie_ids = MovieCategory.find_by(sort_order: category.sort_order - 1).movies.pluck(:id)
      sent_movie_ids   = current_user.feedbacks.pluck(:movie_id)
      target_movie_ids.each do |id|
        return false unless sent_movie_ids.include?(id)
      end
      return true
    elsif category.subject == 'staff'
      if category.sort_order == MovieCategory.where(must_view: true).where(subject: 'staff').minimum(:sort_order)
        return true
      end
      if !MovieCategory.find_by(sort_order: category.sort_order - 1).blank? &&
        !MovieCategory.find_by(sort_order: category.sort_order - 1).must_view
        return true
      end
      if !MovieCategory.find_by(sort_order: category.sort_order).blank? &&
        !MovieCategory.find_by(sort_order: category.sort_order).must_view
        return true
      end
      target_movie_ids = MovieCategory.find_by(sort_order: category.sort_order - 1).movies.pluck(:id)
      sent_movie_ids   = current_user.feedbacks.pluck(:movie_id)
      target_movie_ids.each do |id|
        return false unless sent_movie_ids.include?(id)
      end
      return true
    end
  end
  
  # 感想の提出状況を判定 ※未使用のためコメントアウト（2018/03/08 春海）
  # def send_feedbacks_comp?
  #   sent_movie_ids = current_user.feedbacks.pluck(:movie_id)
  #   last_category = MovieCategory.find_by(sort_order:  MovieCategory.count)
  #   return false if last_category.nil?
  #   if last_category.try(:movies).present?
  #     last_movie_id = last_category.movies.order('sort_order').last.id
  #   else
  #     last_movie_id = MovieCategory.find_by(sort_order: MovieCategory.count - 1).movies.order('sort_order').last.id
  #   end

  #   return sent_movie_ids.include?(last_movie_id) ? true : false
  # end
end