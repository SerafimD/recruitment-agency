json.extract! vacancy, :id, :name, :addition_date, :duration, :salary, :contact, :created_at, :updated_at
json.url vacancy_url(vacancy, format: :json)