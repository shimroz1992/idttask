# frozen_string_literal: true

module Api
  module V1
    class ProductController < ApplicationController
      before_action :set_product, only: %i[add_review]

      def index
        products = Product.all
        json_response(products)
      end

      def add_review
        review = @product.reviews.new(review_params)
        if review.save
          json_response({ review: review, product: @product }, :created)
        else
          json_response({ error: review.errors, success: false }, :unprocessable_entity)
        end
      end

      private

      def set_product
        @product = Product.find(params[:product_id])
      end

      def review_params
        params.permit(:product_id, :description, :name, :user_id)
      end
    end
  end
end
