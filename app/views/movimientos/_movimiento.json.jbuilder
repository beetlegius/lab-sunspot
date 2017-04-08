json.extract! movimiento, :id, :name, :ammount, :cliente_id, :created_at, :updated_at
json.url movement_url(movimiento, format: :json)
