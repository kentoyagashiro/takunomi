class ToppagesController < ApplicationController
  def index
     @pagy, @review = pagy(Review.all, items: 3)
     #@review = Review.all(items: 3)
  end
end
