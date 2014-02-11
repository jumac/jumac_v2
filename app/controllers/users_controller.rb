require 'securerandom'

class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :get_all_roles, only: [:edit]

  # GET /users
  # GET /users.json
  def index
    @users = User.order(:username)
  end

  # GET /users/new
  def new
    @user = User.new
    @user.build_user_profile
  end

  # GET /users/1/edit
  def edit
    
    if !@user.user_profile 
      @user.build_user_profile
    end
    if !@user.roles 
      @user.roles.build
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.verification_code = SecureRandom.base64(10)


    respond_to do |format|
      if @user.save
        UserConfirmationMailer.registration_confirmation(@user).deliver
        format.html { redirect_to users_path, notice: "User #{@user.username} was successfully created." }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    set_user

    # @userroles = params["user"]["role_ids"]
    # if !@userroles 
    #   @userroles.each do |role_id|
    #     puts role_id
    #   end
    # end

    if !@user.user_profile 
      @user.build_user_profile
    end    
    respond_to do |format|
      if @user.update(user_params)                
        format.html { redirect_to users_path, notice: "User #{@user.username} was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path }
      format.json { head :no_content }
    end
  end

  def email_verification

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.includes(:user_profile, :roles).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation,
        user_profile_attributes: [:id, :user_id, :last_name, :first_name, :middle_name, 
          :mobile_no, :land_line, :address1, :address2, :city], :role_ids => [])
    end

    def get_all_roles
      @roles = Role.all
    end
end
