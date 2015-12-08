class ListingsController < ApplicationController
  before_action :find_listing, only: [:show, :edit, :destroy ]

  def index
    @listings = Listing.all
  end

  def show
    @inqueries = @listing.inqueries
    @realtor = Realtor.find(@listing.realtor_id)
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      redirect_to listings_path
    else
      render :new  
    end
  end

  def edit
  end

  def destroy
    if @listing.destroy
      redirect_to listings_path
    else
      redirect_to listing_path(@listings) 
    end
  end

  private
    def listing_params
      params.require(:listing).permit(:address, :description, :zip, :square_footage)
    end
   
    def find_listing
      @listing = Listing.find(params[:id])
    end
end
