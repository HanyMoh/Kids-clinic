class DashboardController < ApplicationController
  def index
    @last_shank = Visit.last_shank
    @current_visits = Visit.current_visits Date.current
  end
end
