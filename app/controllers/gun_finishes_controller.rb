class GunFinishesController < ApplicationController

  def index
    gun_finish_all
  end

  def new
    @gunfinish = GunFinish.new
  end

  def create
    @gunfinish = GunFinish.new(gun_finish_params)
    if @gunfinish.save
      redirect_to gun_finishes_path, :notice => "Gun finish named #{@gunfinish.name} was created successfully."
    else
      render 'new'
    end
  end

  def edit
    @gunfinish = GunFinish.find(params[:id])
  end

  def update
    @gunfinish = GunFinish.find(params[:id])
    if @gunfinish.update_attributes(gun_finish_params)
      redirect_to gun_finishes_path, :notice => "Gun finish named #{@gunfinish.name} was updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @gunfinish = GunFinish.find(params[:id])
    @gunfinish.destroy
    redirect_to gun_finishes_path, :notice => "Gun finish named #{@gunfinish.name} was deleted successfully."
  end

  private 
  def gun_finish_params
    params.require(:gun_finish).permit(:name, :description)
  end

  def gun_finish_all
    @gunfinishes = GunFinish.all
  end
end
