class CustomersController < ApplicationController

  def index
    @customers = Customer.all.decorate
  end

  def new
    @customer = Customer.new
  end

  def edit
    set_customer
  end

  def show
    @customer = Customer.find(params[:id]).decorate
  end

  def create
    @customer = Customer.new customer_create_params
    set_customer_package_and_additional_services

    if @customer.save
      BillingService.perform(@customer)
      redirect_to(@customer)
    else
      render(:new)
    end
  end

  def update
    set_customer
    @customer.update(customer_update_params) ? redirect_to(@customer) : render(:edit)
  end

  def destroy
    set_customer
    # binding.pry
    @customer.destroy
    redirect_to customers_path
  end

  private

  def set_customer_package_and_additional_services
    unless @customer.customers_package.package_id == nil
      @customer.customers_package.price = @customer.customers_package.package.price
    end

    @customer.customers_additional_services.each do |cas|
      unless cas.additional_service_id == nil
        cas.price = cas.additional_service.price
      end
    end
  end

  def customer_create_params
    params.require(:customer).permit(
        :name,
        :cpf,
        customers_additional_services_attributes: [:additional_service_id, :id, :_destroy],
        customers_package_attributes: [:package_id, :id, :destroy]
    )
  end

  def customer_update_params
    params.require(:customer).permit(:name, :cpf)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end

end
