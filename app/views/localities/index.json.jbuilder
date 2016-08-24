json.array!(@localities) do |locality|
  json.extract! locality, :id, :municipio, :sector, :fecha, :activo
  json.url locality_url(locality, format: :json)
end
