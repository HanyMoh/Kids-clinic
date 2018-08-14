json.extract! patient, :id, :code, :name, :phone, :birthdate, :region_id, :address, :note, :created_at, :updated_at
json.url patient_url(patient, format: :json)
