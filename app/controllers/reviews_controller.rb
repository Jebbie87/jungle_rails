class ReviewsController < ApplicationController

  before_filter :current_user?
  def create
    Review.create(
      description: params[:review][:description],
      rating: params[:review][:rating],
      product_id: params[:product_id],
      user: current_user
    )
    redirect_to "/products/#{params[:product_id]}"
  end

  private

  def current_user?
    if !current_user
      redirect_to "/sessions/new"
    end
  end
end
