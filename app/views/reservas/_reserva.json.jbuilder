json.extract! reserva, :id, :solicitante, :data, :solicitante_id, :descricao, :created_at, :updated_at
json.url reserva_url(reserva, format: :json)
