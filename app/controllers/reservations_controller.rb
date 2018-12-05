class ReservationsController < ApplicationController
  def create
    @reservation = Reservation.create(reservation_params)

    redirect_to listings_path
  end

private

  def reservation_params
    params.require(:reservation).permit(:user_id, :listing_id)
  end
end
