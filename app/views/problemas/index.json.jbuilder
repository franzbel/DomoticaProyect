json.array!(@problemas) do |problema|
  json.extract! problema, :id, :thermostat_id, :description, :status, :resolution
  json.url problema_url(problema, format: :json)
end
