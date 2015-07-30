class OrdercontentsController < ApplicationController

  def new
    @ordercontent = OrderContent.new
  end
end
