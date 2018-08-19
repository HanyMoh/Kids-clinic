class DashboardController < ApplicationController
  def index
    @last_shank = Visit.last_shank
    @current_visits = Visit.current_visits Date.current
  end
  def male_female_percentage
    render json: Patient.group(:is_male).count.map{ |k, v|
      if k
        k = "ذكر"
      else
        k = "أنثى"
      end
      [[k], v]
    }
  end
end
