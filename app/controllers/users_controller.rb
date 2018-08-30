class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin, only: :create
  before_action :set_user, only: [:show, :edit, :update]

def index
  authorize! :read, User
  @users = User.all
end

def new
  authorize! :create, User
  @user = User.new
end

def edit
  authorize! :update, User
end

def create
  @user = User.new(user_params)

  respond_to do |format|
    if @user.save
      format.html { redirect_to users_url, notice: 'User was successfully created.' }
    else
      format.html { render :new }
    end
  end
end

def update
  respond_to do |format|
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete('password')
      params[:user].delete('password_confirmation')
    end
    if @user.update(user_params)
      format.html { redirect_to users_url, notice: 'تم إجراء التعديلات بنجاح.' }
    else
      format.html { render :edit }
    end
  end
end

private

# Use callbacks to share common setup or constraints between actions.
def set_user
  @user = User.find(params[:id])
end

# This should probably be abstracted to ApplicationController
# as shown by diego.greyrobot
def authorize_admin
  return unless !current_user.is_admin
  redirect_to root_path, alert: 'Admins only!'
end

# Never trust parameters from the scary internet, only allow the white list through.
def user_params
  params.require(:user).permit(:email, :is_active, :is_admin, :password, :password_confirmation)
end
end
