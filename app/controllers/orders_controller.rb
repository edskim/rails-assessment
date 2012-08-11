class OrdersController < ApplicationController
  respond_to :html, :json

  def index
    @orders = Order.all
    respond_with(@orders)
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(params[:order])
    @order.save
    respond_with(@order)
  end

end
