json.(@party, :name, :location)

json.guests(@party.guests, :name) do |guest|
  json.name guest.name
  json.gifts(guest.gifts, :title, :description)
end
