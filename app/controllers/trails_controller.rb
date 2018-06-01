class TrailsController < ApplicationController
  def show
    @trail = Trail.find(params[:id])
    @trail_trips = @trail.trips
  end
end
