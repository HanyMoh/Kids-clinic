class ReportsController < ApplicationController
  def index
  end
  def visits_reports
    params[:st_date] ||= 3.month.ago
    params[:en_date] ||= Time.current

    @visits = Visit.period(params[:st_date], params[:en_date])
  end
  def kids_by_region
    render json: Patient.includes(:regions).group(:region).count.map { |k, v| [k.name, v] }
  end
  def kids_by_birthdate
    render json: Patient.group_by_year(:birthdate, format: "%Y").count
  end
  def gender_percentage
    render json: Patient.group(:is_male).count.map{ |k, v|
      if k
        k = "ذكر"
      else
        k = "أنثى"
      end
      [[k], v]
    }
  end
  def visits_by_visit_type
    render json: Visit.group(:visit_type).count.map{ |k, v|
      [[k.name], v]
    }
  end

end
