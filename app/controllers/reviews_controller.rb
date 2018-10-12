class ReviewsController < ApplicationController

  def create

    @product = Product.find(params[:product_id])
    new_review = @product.reviews.new(review_params)
    new_review.user = current_user

    if new_review.save        # performs the save, and if save is successful, then becomes true
      redirect_to @product
    else
      redirect_to @product, notice: "Error saving review"
    end

  end

  def review_params       # strong param (so only rating and description are passed in - otherwise some users can pass in other parameters and make themselves an admin for example)
    params.require(:review).permit(:rating, :description)
  end

  def destroy
    # if current_user == review.user_id
      Review.destroy(params[:id])
      redirect_to :back
    # else
    #   redirect_to @product
    end

end

