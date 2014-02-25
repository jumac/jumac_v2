class GunCalibersController < ApplicationController
  def index
    gun_caliber_all 
  end

  def new
    @guncaliber = GunCaliber.new
  end

  def edit
    @guncaliber = GunCaliber.find(params[:id])
  end

  def create
    @guncaliber = GunCaliber.new(gun_caliber_params)
    if @guncaliber.save 
      redirect_to gun_calibers_path, :notice => "Gun caliber #{@guncaliber.name} was saved successfully."
    else 
      render 'new'
    end
  end

  def update
    @guncaliber = GunCaliber.find(params[:id])
    if @guncaliber.update_attributes(gun_caliber_params)
      redirect_to gun_calibers_path, :notice => "Gun caliber #{@guncaliber.name} was updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @guncaliber = GunCaliber.find(params[:id])
    @guncaliber.destroy
    redirect_to gun_calibers_path, :notice => "Gun caliber #{@guncaliber.name} was deleted successfully."
  end

  private
  def gun_caliber_params 
    params.require(:gun_caliber).permit(:name, :description)
  end

  def gun_caliber_all
    @guncalibers = GunCaliber.all
  end
end
