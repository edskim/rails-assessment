class CustomersController < ApplicationController
  respond_to :html, :json

  def index
    @customers = Customer.all
    respond_with(@customers)
  end

  def show
    @customer = Customer.find(params[:id])
    respond_with(@customer)
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(params[:customer])
    @customer.save
    respond_with(@customer)
  end

end
