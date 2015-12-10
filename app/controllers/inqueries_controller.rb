class InqueriesController < ApplicationController
  before_action :params_id, only: [:show, :edit, :destroy]
  def show
  end

  def index
    @listings = Realtor.find(params[:realtor_id]).listings.map(&:id)
    @inqueries = Inquery.where(listing_id: @listings)
  end


  def edit
  end

  def new
    @inquery = Inquery.new
    @listing = Listing.find(params[:listing_id])
  end

  def create
    @inquery = Inquery.create(inquery_params)
    if @inquery.update(listing_id: params[:listing_id])
      flash[:notice] = 'Inquery Successfully Created'
      redirect_to listings_path
    else
      render :new
    end
  end

  def destroy
    if @inquery.destroy
      redirect_to listings_path
    else
      redirect_to inquery_path(@inquery) 
    end
  end

  private
  
  def params_id
    @inquery = Inquery.find(params[:id])
  end

  def inquery_params
    params.require(:inquery).permit(:first_name, :last_name, :phone_number, :email)
  end
end
