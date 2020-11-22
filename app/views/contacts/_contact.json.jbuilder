json.extract! contact, :id, :first_name, :middle_name, :last_name, :email, :mobile_number, :landline_number, :notes, :image, :created_at, :updated_at
json.url contact_url(contact, format: :json)
