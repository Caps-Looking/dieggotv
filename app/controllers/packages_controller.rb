class PackagesController < ApplicationController

  def index
    @packages = Package.all
  end

  def new
    @package = Package.new
  end

  def edit
    set_package
  end

  def show
    set_package
  end

  def create
    @package = Package.new(package_params)
    @package.save ? redirect_to(@package) : render(:new)
  end

  def update
    set_package
    @package.update(package_params) ? redirect_to(@package) : render(:edit)
  end

  def destroy
    set_package
    @package.destroy
    redirect_to packages_path
  end

  private

  def package_params
    params.require(:package).permit(:name, :price)
  end

  def set_package
    @package = Package.find(params[:id])
  end

end
