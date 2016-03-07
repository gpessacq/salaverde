json.array!(@salas) do |sala|
  json.extract! sala, :id, :nombre, :apellido, :cumple, :email, :fecha_festejo, :lugar_festejo
  json.url sala_url(sala, format: :json)
end
