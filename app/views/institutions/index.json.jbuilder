json.array!(@institutions) do |institution|
  json.extract! institution, :id, :nombre
  json.url institution_url(institution, format: :json)
end
