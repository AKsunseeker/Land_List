class InqueriesController < ApplicationController
 before_action :params_id, only: [:show, :edit, :destroy]
 def show
 end

 def index
   #@realtor = current_realtor
   #@inqueries = current_realtor.inqueries
   @inqueries = Inquery.where(:realtor_id => params[:realtor_id])
   #@listings = Realtor.find(params[:realtor_id]).listings.map(&:id)
   #@inqueries = Inquery.where(listing_id: @listings)
 end


 def edit
 end

 def new
   @inquery = Inquery.new
   @listing = Listing.find(params[:listing_id])
 end

 def create
   @inquery = Inquery.new
   if @inquery.save(inquery_params)
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
   params.require(:inquery).permit(:first_name, :last_name, :phone_number, :email, :realtor_id)
 end
end