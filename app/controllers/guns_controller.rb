class GunsController < ApplicationController
  before_action :set_gun, only: [:edit, :update, :destroy]
  before_action :get_all_calibers, only: [:new, :edit]
  before_action :get_all_finishes, only: [:new, :edit]
  before_action :get_all_category, only: [:new, :edit]
  before_action :get_all_manufacturer, only: [:new, :edit]

  def index
    @guns = Gun.all
  end

  def new
    @gun = Gun.new
    @gun.gun_calibers.build 
    @gun.gun_finishes.build
  end

  def create
    @gun = Gun.new(gun_params)

    if @gun.save
      redirect_to guns_path, :notice => "Gun #{@gun.model_name} was created successfully."
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private
  def set_gun
    @gun = Gun.include(:gun_calibers, :gun_finishes).find(params[:id])
  end

  def gun_params
    params.require(:gun).permit(:model_name, :short_desc, :long_desc, :gun_category_id, :gun_manufacturer_id,       
      :gun_finish_ids, 
      :gun_available_calibers_attributes => [:id, :gun_caliber_id, :round_capacity] 
      )
  end

  def get_all_calibers
    @guncalibers = GunCaliber.all
  end

  def get_all_finishes 
    @gunfinishes = GunFinish.all
  end

  def get_all_category
    @guncategory = GunCategory.all
  end

  def get_all_manufacturer
    @gunmanufacturer = GunManufacturer.all
  end
end
