class CreditCardsController < ApplicationController

  def destroy
    @user = User.find(params[:id])
    @user.credit_card.destroy
    if @user.credit_card.destroy
      flash[:success] = "Credit Card successfully deleted!"
      redirect_to products_path
    else
      flash.now[:danger] = 'Oops, there was an error deleting your credit card.'
      
    end
    redirect_to users_path
  end

  # def show
  #   @credit_card = User.find(params[:id]).credit_card
  # end

end
