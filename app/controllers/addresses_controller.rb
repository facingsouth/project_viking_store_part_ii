class AddressesController < ApplicationController

  def index
    if params[:id]
      @addresses = Address.where("user_id = ?", params[:id])
      @user = User.find(params[:id])
      # render :show_user_addresses
    else
      @addresses = Address.all
    end

  end

  def new
    @address = Address.new

    @states = State.all
    @cities = City.all
    @user = User.find(params[:id])
    @address.user_id = @user.id
  end

  def create
    @address = Address.new(params_hash)
    if @address.save
      flash[:success] = "Successfully Created New Address"
      redirect_to addresses_path({id: @address.user.id})
    else
      flash.now[:error] = "Failed to create new user"
      render :new
    end
  end

  def show 
    @address = Address.find(params[:id])
    # @addresses = Address.where("user_id = ?" , params[:id])
  end

  def edit
    @address = Address.find(params[:id])
    @user = @address.user
    @states = State.all
    @cities = City.all
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(params_hash)
      flash[:success] = "Successfully Updated New Address"
      redirect_to addresses_path({id: @address.user.id})
    else
      render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path({id: @address.user.id})

  end


  private
    def params_hash
      params.require(:address).permit(:street_address, :secondary_address, :city_id, :state_id, :zip_code, :user_id)
    end
end
