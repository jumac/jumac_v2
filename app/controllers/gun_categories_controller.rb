class GunCategoriesController < ApplicationController
  def index
    guncategory_all 
  end

  def new
    @guncategory = GunCategory.new
  end

  def edit
    @guncategory = GunCategory.find(params[:id])
  end

  def create 
    @guncategory = GunCategory.new(guncategory_params)

    if @guncategory.save
      redirect_to gun_categories_path, :notice => "Gun category #{@guncategory.name} was saved successfully."
    else
      render 'new'
    end
  end

  def update    
    @guncategory = GunCategory.find(params[:id])

    if @guncategory.update_attributes(guncategory_params)
      redirect_to gun_categories_path, :notice => "Gun category #{@guncategory.name} was updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
  	@guncategory = GunCategory.find(params[:id])
  	@guncategory.destroy
  	redirect_to gun_categories_path, :notice => "Gun category #{@guncategory.name} was deleted successfully."
  end

  private
  def guncategory_params
    params.require(:gun_category).permit(:name, :description)
  end

  def guncategory_all
    @guncategories = GunCategory.all
  end
end 
