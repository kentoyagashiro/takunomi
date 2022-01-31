class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    review = Review.find(params[:review_id])
    current_user.favorite(review)
    flash[:success] = 'お気に入りに追加しました。'
    redirect_to likes_user_path(current_user)
  end

  def destroy
    review = Review.find(params[:review_id])
    current_user.unfavorite(review)
    flash[:success] = 'お気に入りから削除しました。'
    redirect_to likes_user_path(current_user)
  end
end
