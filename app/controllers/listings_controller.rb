class ListingsController < ApplicationController
  before_action :find_listing, only: [:show, :edit, :update, :destroy]
  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
    @reservation = Reservation.new

  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.create(listing_params)
    redirect_to @listing
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_listing
    @listing = Listing.find(params[:id])
  end


  def listing_params
    params.require(:listing).permit(:title, :image_url, :description, :location, :price)
  end
end
