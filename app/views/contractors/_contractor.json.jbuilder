json.extract! contractor, :id, :type, :name, :fullname, :email, :manager, :created_at, :updated_at
json.url contractor_url(contractor, format: :json)
