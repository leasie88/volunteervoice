module ReviewsHelper
  def rating_ballot
      if @rating = current_user.ratings.where(:review_id => params[:id])
          @rating
      else
          current_user.ratings.new
      end
  end
  
  def current_user_rating
      if @rating = current_user.ratings.where(:review_id => params[:id])
          @rating.value
      else
          "N/A"
      end
  end
end
