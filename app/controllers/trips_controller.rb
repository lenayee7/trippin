class TripsController < ApplicationController

	def index
		@trips = current_user.trips
		render :index
	end

	def new
		@trip = Trip.new
		render :new
	end

	def create
		@trip = current_user.trips.create(trip_params)
		redirect_to "/trips"
	end

 	def show
		@trip = current_user.trips.find(params[:id])
		@posts = @trip.posts
		render :show
	end

	def edit 
		@trip = Trip.find(params[:id])
	end

	def update
		trip = Trip.find(params[:id])
		trip.update_attributes(trip_params)
		flash[:success] = "Trip updated"
		redirect_to trip
	end

	def destroy
		trip = current_user.trips.find(params[:id])
    trip.destroy
  	redirect_to "/trips"
	end

private

	def trip_params
		params.require(:trip).permit(:location, :description, :start_date, :end_date)
	end

end