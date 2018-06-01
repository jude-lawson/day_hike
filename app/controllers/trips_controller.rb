class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
    @trip_trails = @trip.trails
    @trip_length = @trip_trails.sum(:length)
    @trail_average = @trip.trails.average(:length)
    @longest_trail = @trip.trails.maximum(:length)
    @shortest_trail = @trip.trails.minimum(:length)
  end
end
