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
    set_customer_package_and_additional_services

    binding.pry
    if @customer.save
      GenerateBillsService.perform(@customer)
      redirect_to(@customer)
    else
      render(:new)
    end
  end

  def update
  end

  def destroy
    set_customer
    @customer.destroy
    redirect_to customers_path
  end

  private

  def set_customer_package_and_additional_services
    @customer.customers_package.price = @customer.customers_package.package.price

    @customer.customers_additional_services.each do |cas|
      unless cas.additional_service_id == nil
        cas.price = cas.additional_service.price
      end
    end
  end

  def customer_params
    params.require(:customer).permit(:name, :cpf, :package_id,
                                     customers_additional_services_attributes: [:additional_service_id, :id, :_destroy],
                                     customers_package_attributes: [:package_id, :id, :destroy])
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end

end
