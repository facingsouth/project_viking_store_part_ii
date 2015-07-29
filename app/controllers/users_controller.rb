class UsersController < ApplicationController
  include UsersHelper

  def index 
    @users = User.all

  end

  def show
    @user = User.find(params[:id])
  end

  def unplaced
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
    @addresses = Address.all
  end

<<<<<<< HEAD
  def create
    @user = User.new(params_hash)
    @user.billing_id = 1
    @user.shipping_id = 2
    if @user.save
      flash[:success] = "Successfully Create New User"
      redirect_to users_path
    else
      flash.now[:error] = "Failed to create new user"
      render :new
    end
  end



  def edit 
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params_hash)
      redirect_to users_path
      flash[:success] = "User Successfully Updated"
    else
      flash.now[:error] = "Failed to updated User. Please try again"
      render :edit
    end
  end
  
  def new
    @user = User.new
    @addresses = Address.all
  end

  def create
    @user = User.new(params_hash)
    @user.billing_id = 1
    @user.shipping_id = 2
    if @user.save
      flash[:success] = "Successfully Create New User"
      redirect_to users_path
    else
      flash.now[:error] = "Failed to create new user"
      render :new
    end
  end



  def edit 
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params_hash)
      redirect_to users_path
      flash[:success] = "User Successfully Updated"
    else
      flash.now[:error] = "Failed to updated User. Please try again"
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "USER OBLITERATED"
    redirect_to users_path
  end


  private

    def params_hash
      params.require(:user).permit(:first_name, :last_name, :email, :billing_id, :shipping_id)
    end

end
