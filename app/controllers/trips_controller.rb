class TripsController < ApplicationController
    def index
      trips = Trip.where(owner_id: current_user).or(Trip.where(assignee_id: current_user))
      render :json => trips
    end
    
    def create 
      assignee = User.find_by(username: trip_params[:assignee])
      trip = Trip.create(
          owner: current_user, 
          assignee: assignee, 
          arrival: trip_params[:arrival], 
          completion: trip_params[:completion]
        )
      render :json => trip
    end 

    def reassign 
      og_trip = Trip.find(params[:id])
      return unless og_trip.can_be_reassigned_by?(current_user)

      assignee = User.find_by(username: trip_params[:assignee])

      reassigned_trip = Trip.create(
        owner: current_user,
        uuid: og_trip.uuid, 
        arrival: og_trip.arrival,
        completion: og_trip.completion,
        assignee: assignee
      )
      og_trip.mark_outdated
      render :json => reassigned_trip
    end 

    def checkin 
      trip = Trip.find(params[:id])
      return unless trip.can_be_checked_in_by?(current_user)

      all_trips = Trip.where(uuid: trip.uuid)

      all_trips.update_all(status: :in_progress, checkin: Time.now)
    end 

    def checkout
      trip = Trip.find(params[:id])
      return unless trip.can_be_checked_out_by?(current_user)

      all_trips = Trip.where(uuid: trip.uuid)

      all_trips.update_all(status: :completed, checkout: Time.now)
    end 

    private 
    def current_user
      username = params[:self]
      @current_user ||= User.find_by(username: username)
    end 

    def trip_params
      params.require(:trip).permit(:assignee, :arrival, :completion)
    end
end 