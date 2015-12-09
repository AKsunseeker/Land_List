class InqueriesController < ApplicationController
  before_action :params_id, only: [:show, :edit, :destroy]
  def show
  end

  def edit
  end

  def new
    @inquery = Inquery.new
    @listing = Listing.find(params[:listing_id])
  end

  def create
    @inquery = Inquery.new(inquery_params)
    @listing = Listing.find(@inquery.listing_id)
    if @inquery.save
      redirect_to listing_path(@listing)
    else
      render :new
    end
  end

  def destroy
    if @inquery.destroy
      redirect_to listing_path
    else
      redirect_to inquery_path(@inquery) 
    end
  end

  private
  
  def params_id
    @inqueries = Inquery.find(params[:id])
  end

  def inquery_params
    params.require(:inquery).permit(:first_name, :last_name, :phone_number, :email)
  end
end
