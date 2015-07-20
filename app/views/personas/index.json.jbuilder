json.array!(@personas) do |persona|
  json.extract! persona, :id, :nombre1, :nombre2, :apellido1, :apellido2, :cedula, :direccion, :referencia, :municipio, :parroquia, :telefono1, :telefono2
  json.url persona_url(persona, format: :json)
end
