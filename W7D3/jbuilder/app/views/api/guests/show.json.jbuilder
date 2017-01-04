json.(@guest, :name, :age, :favorite_color)

json.partial! 'api/guests/guest', guest: @guest

json.gifts(@guest.gifts, :title, :description)
