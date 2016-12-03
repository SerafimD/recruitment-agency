json.extract! worker, :id, :surname, :name, :middle_name, :email, :phone, :in_search, :salary, :created_at, :updated_at
json.url worker_url(worker, format: :json)