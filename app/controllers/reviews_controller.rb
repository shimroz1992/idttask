# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.friendly.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user_id = current_user.id
    @review.save
    @review.rate params[:test].to_f, current_user, 'quality'
    redirect_to product_path(@product)
  end

  private

  def review_params
    params.require(:review).permit(:name, :description)
  end
end
