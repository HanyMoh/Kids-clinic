class DashboardController < ApplicationController

  layout :layout_by_resource
  def layout_by_resource
    if action_name == 'new'
      'devise'
    else
      'application'
    end
  end

  def index
    if user_signed_in?
      unless current_user.is_active
        redirect_to dashboard_new_url, notice: 'معذرة .. حسابك غير نشط, تابع مع الإدارة'
      else
        @current_visits = Visit.current_visits Date.current
      end
    else
      redirect_to dashboard_new_url
    end
  end

  def new
  end
end
