class AdditionalServicesController < ApplicationController

  def index
    @additional_services = AdditionalService.all
  end

  def new
    @additional_service = AdditionalService.new
  end

  def edit
    set_additional_service
  end

  def show
    set_additional_service
  end

  def create
    @additional_service = AdditionalService.new additional_service_params
    @additional_service.save ? redirect_to(@additional_service) : render(:new)
  end

  def update
    set_additional_service
    @additional_service.update(additional_service_params) ? redirect_to(@additional_service) : render(:edit)
  end

  def destroy
    set_additional_service
    @additional_service.destroy
    redirect_to additional_services_path
  end

  private
  def additional_service_params
    params.require(:additional_service).permit(:name, :price)
  end

  def set_additional_service
    @additional_service = AdditionalService.find(params[:id])
  end

end

