class InqueriesController < ApplicationController
  before_action :params_id, only: [:show, :edit ]
  def show
  end

  def edit
  end

  def new
    @inquery = Inquery.new
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
  
  private
  
  def params_id
    @inqueries = Inquery.find(params[:id])
  end

  def inquery_params
    params.require(:inquery).permit(:first_name, :last_name, :phone_number, :email)
  end
end
