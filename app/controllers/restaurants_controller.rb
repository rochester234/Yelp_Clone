class RestaurantsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user_id = current_user.id
    if @restaurant.save
      redirect_to restaurants_path
    else
      render 'new'
    end
  end


  def restaurant_params
    params.require(:restaurant).permit(:name)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])

  end

  def update
    @restaurant = Restaurant.find(params[:id])
  

    if @restaurant.user_id == current_user.id
      @restaurant.update(restaurant_params)
      flash[:notice] = 'Restaurant updated successfully'
    else
      flash[:notice] = 'You have no permission to update this restaurant'
    end

    redirect_to '/restaurants'
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.user_id == current_user.id
      @restaurant.destroy
      flash[:notice] = 'Restaurant deleted successfully'
    else
      flash[:notice] = 'You have no permission to delete this restaurant'
    end


    redirect_to '/restaurants'
  end


end
