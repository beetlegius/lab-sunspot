json.extract! cliente, :id, :fullname, :from, :to, :age, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
