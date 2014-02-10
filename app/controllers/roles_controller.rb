class RolesController < ApplicationController
  before_filter :authorize
  
  def index
    roles_all
  end
  
  def new
    @role = Role.new()
  end

  def edit
    @role = Role.find(params[:id])
  end

  def create
    @role = Role.new(role_params)

    if @role.save
      redirect_to roles_path, :notice => "Role #{@role.name} was saved successfully."
    else
      render 'new'
    end
  end

  def update
    @role = Role.find(params[:id])

    if @role.update_attributes(role_params)
      redirect_to roles_path, :notice => "Role #{@role.name} was updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @role = Role.find(params[:id])
    @role.destroy
    redirect_to roles_path, :notice => "Role #{@role.name} was deleted successfully."
  end

  private
  def role_params
    params.require(:role).permit(:name, :description)
  end

  def roles_all
    @roles = Role.all
  end
end
