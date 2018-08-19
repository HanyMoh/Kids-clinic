class DashboardController < ApplicationController
  def index
    @current_visits = Visit.current_visits Date.current
  end
end
