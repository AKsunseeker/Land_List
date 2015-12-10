class ListingsController < ApplicationController
  before_action :find_listing, only: [:show, :edit, :destroy, :update]

  def index
    @listings = Listing.all
    @listing = Listing.new if realtor_signed_in?
    @realtor = current_realtor
  end

  def show
    @inqueries = @listing.inqueries
    @realtor = Realtor.find(current_realtor) if current_realtor
    @listings = Listing.all.order updated_at: :desc
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      @listing.update(realtor_id: params[:realtor_id])
      redirect_to listings_path
    else
      render :new  
    end
  end

  def edit
  end

  def update
    if @listing.update(listing_params)
      redirect_to listings_path(@listing)
    else
      render :edit
    end
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
      params.require(:listing).permit(:address, :description, :zip, :square_footage, :realtor_id, :avatar)
    end
   
    def find_listing
      @listing = Listing.find(params[:id])
    end
end
