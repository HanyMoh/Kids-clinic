class ReportsController < ApplicationController
  def index
  end

  def visits_reports
    params[:st_date] ||= 1.month.ago
    params[:en_date] ||= Time.current
    @visits           = Visit.period(params[:st_date], params[:en_date])
    @visits_by_type   = visits_by_visit_type
  end

  def kids_by_region
    render json: Patient.includes(:regions).group(:region).count.map { |k, v|
      if k.nil?
        ['مجهولة', v]
      else
        [k.name, v]
      end
    }
  end

  def males_by_region
    render json: Patient.where(is_male: true).includes(:regions).group(:region).count.map { |k, v|
      if k.nil?
        ['مجهولة', v]
      else
        [k.name, v]
      end
    }
  end

  def females_by_region
    render json: Patient.where(is_male: false).includes(:regions).group(:region).count.map { |k, v|
      if k.nil?
        ['مجهولة', v]
      else
        [k.name, v]
      end
    }
  end

  def kids_by_birthdate
    render json: Patient.group_by_year(:birthdate, format: "%Y").count
  end

  def males_by_birthdate
    render json: Patient.where(is_male: true).group_by_year(:birthdate, format: "%Y").count
  end

  def females_by_birthdate
    render json: Patient.where(is_male: false).group_by_year(:birthdate, format: "%Y").count
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
      params[:st_date] ||= 1.month.ago
      params[:en_date] ||= Time.current
       Visit.period(params[:st_date], params[:en_date]).group(:visit_type).count.map{ |k, v|
        [[k.name], v]
      }
  end

end
