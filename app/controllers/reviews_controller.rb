class ReviewsController < ApplicationController
  before_action :require_user_logged_in, only: [:new]
   before_action :correct_user, only:[:edit, :update, :destroy]
  
  def index
      @pagy, @review = pagy(Review.all, items: 10)
      #@review = Review.all
  end

  def show
      @review = Review.find(params[:id])
  end

  def new
      @review = Review.new
  end

  def create
     @review = current_user.reviews.build(review_params)

    if @review.save
      flash[:success] = 'レビュー が正常に投稿されました'
      redirect_to @review
    else
      #@review = pagy(current_user.reviews.order(id: :desc))
      flash.now[:danger] = 'レビュー が投稿されませんでした'
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(review_params)
      flash[:success] = 'レビュー は正常に更新されました'
      redirect_to @review
    else
      flash.now[:danger] = 'レビュー は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    flash[:success] = 'レビュー は正常に削除されました'
    redirect_to reviews_url
  end
  
  private
  
  def review_params
    params.require(:review).permit(:title, :comment, :combi, :buystore)
  end
  
  def correct_user
    @review = current_user.reviews.find_by(id: params[:id])
    unless @review
      redirect_to root_url
    end
  end
end
