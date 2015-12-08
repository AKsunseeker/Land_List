class RealtorsController < ApplicationController
  before_action :params_id, only: [:show, :update, :edit, :destroy]
  def index
    @realtors = Realtor.all
  end

  def show
    @listings = @realtor.listings
  end

  def new
    @realtor = Realtor.new
  end

  def create
    @realtor = Realtor.new(realtor_params)
    if @realtor.save
      redirect_to realtors_path
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @realtor.update(realtor_params)
      redirect_to realtors_path(@realtor)
    else
      render :edit
    end
  end

  def destroy
    if @realtor.destroy
      redirect_to realtors_path
    else
      redirect_to realtor_path(@realtor)
    end
  end

  private
    def realtor_params
      params.require(:realtor).permit(:first_name, :last_name, :company_name, :phone_number)
    end

    def params_id
      @realtor = Realtor.find(params[:id])
    end
end





