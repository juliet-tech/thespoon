class RestaurantsController < ApplicationController

  # Our fake database
  RESTAURANTS = {
      1 => { name: "Dishoom", address: "Shoreditch, London", category: "indian" },
      2 => { name: "Sushi Samba", address: "City, London", category: "japanese" }
    }

  def index
    if params[:food_type].blank?
      @restaurants = RESTAURANTS # Makes sure that if I haven't passed it any additional information through params, then the @restaurant instance variables is the RESTAURANTS hash so we can display all existing restaurants
    else
      # performs a filtering method dependant on what the user inputs in the form.
      @restaurants = RESTAURANTS.select {|id, restaurant| restaurant[:category] == params[:food_type]}
    end
  end

  def create
    # Just returns a plain text proving that we retreived the right information we wanted from the params
    render plain: "Add to DB restaurant '#{params[:name]}' with address '#{params[:address]}'"
  end

  def show
    # Finds the specific restaurant we're looking for based on the params we're getting from the URL
    @restaurant = RESTAURANTS[params[:id].to_i]
  end
end
