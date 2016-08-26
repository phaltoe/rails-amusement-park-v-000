class RidesController < ApplicationController
  def create
    @ride = Ride.create(ride_params)

    if @ride.take_ride == true
      flash[:notice] = "Thanks for riding the #{@ride.attraction.name}!"
    else
      flash[:error] = @ride.take_ride
    end
    redirect_to user_path(@ride.user)
  end

  private

  def ride_params
    params.permit(:user_id, :attraction_id)
  end
end
