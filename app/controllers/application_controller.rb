class ApplicationController < ActionController::Base
  include Pagy::Backend
  include SessionsHelper
    
  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_reviews = user.reviews.count
    @count_likes = user.likes.count
  end
  
end
