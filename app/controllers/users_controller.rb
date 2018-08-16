class UsersController < ApplicationController
  before_action :authenticate_user!
before_action :set_user, only: [:show, :edit, :update]

def index
  authorize! :read, User
  @users = User.all
end

def edit
  authorize! :update, User
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

# Never trust parameters from the scary internet, only allow the white list through.
def user_params
  params.require(:user).permit(:email, :is_active, :is_admin, :password, :password_confirmation)
end
end
