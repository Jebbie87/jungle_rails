class ReviewsController < ApplicationController
  def create
    Review.create(
      description: params[:review][:description],
      rating: params[:review][:rating],
      product_id: params[:product_id],
      user: current_user
    )
    redirect_to "/products/#{params[:product_id]}"
  end
end
