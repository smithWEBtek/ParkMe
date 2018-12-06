class ReservationsController < ApplicationController
  before_action :find_reservation, only: [:show, :edit, :update, :destroy]

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.create(user_id: session[:user_id], listing_id: params[:reservation][:listing_id])
    
    redirect_to @reservation.user
  end

private

  def find_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:user_id, :listing_id)
  end
end
