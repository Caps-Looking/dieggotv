class CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def edit
    set_customer
  end

  def show
    set_customer
  end

  def create
    @customer = Customer.new customer_params
    @customer.save ? redirect_to(@customer) : render(:new)
  end

  def update
  end

  def destroy
    set_customer
    @customer.destroy
    redirect_to customers_path
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :cpf, :package_id, customers_additional_services_attributes: [:additional_service_id, :id, :_destroy] )
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end

end
