json.array!(@ayudas) do |ayuda|
  json.extract! ayuda, :id, :nombre
  json.url ayuda_url(ayuda, format: :json)
end
