module PatientsHelper
  def get_patients_select
    rv = Patient.order(:name).select([ :name, :id ])
    return rv.map{ |y| [ y.name, y.id ] }
  end
end
