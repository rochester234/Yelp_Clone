class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
     @restaurant = Restaurant.find(params[:restaurant_id])
     @review = Review.new(review_params)
     @review.restaurant_id = @restaurant.id
     @review.user_id = current_user.id
     if @review.save
       redirect_to restaurants_path
     else
       flash[:notice] = "Sorry, you can only leave one review per restaurant!"
       redirect_to '/restaurants'
     end
   end

  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @review = Review.find(params[:id])

    if @review.user_id == current_user.id
      @review.destroy
      flash[:notice] = 'Review deleted successfully'
      redirect_to '/restaurants'
    else
      flash[:notice] = 'You have no permission to delete this review'
      redirect_to '/restaurants'
    end
  end
end
