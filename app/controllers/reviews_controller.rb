class ReviewsController < ApplicationController
  def create
    @review.user = current_user
    Review.create(description: params[:review][:description], rating: params[:review][:rating], product_id: params[:product_id])
    redirect_to "/products/#{params[:product_id]}"
  end
end
