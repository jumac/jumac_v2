class GunManufacturersController < ApplicationController
  def index
    gun_manufacturer_all
  end

  def new
    @gunmanufacturer = GunManufacturer.new
  end

  def create
    @gunmanufacturer = GunManufacturer.new(gun_manufacturer_params)
    if @gunmanufacturer.save 
      redirect_to gun_manufacturers_path, :notice => "Manufacturer #{@gunmanufacturer.name} was created successfully."
    else
      render 'new'
    end
  end

  def edit
    @gunmanufacturer = GunManufacturer.find(params[:id])
  end

  def update
    @gunmanufacturer = GunManufacturer.find(params[:id])
    if @gunmanufacturer.update_attributes(gun_manufacturer_params)
      redirect_to gun_manufacturers_path, :notice => "Manufacturer #{@gunmanufacturer.name} was updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @gunmanufacturer = GunManufacturer.find(params[:id])
    @gunmanufacturer.destroy
    redirect_to gun_manufacturers_path, :notice => "Manufacturer #{@gunmanufacturer.name} was deleted successfully."
  end

  private 
  def gun_manufacturer_params
    params.require(:gun_manufacturer).permit(:name, :description)
  end
  def gun_manufacturer_all
    @gunmanufacturers = GunManufacturer.all
  end
end
