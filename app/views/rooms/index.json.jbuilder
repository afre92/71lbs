json.array!(@rooms) do |room|
  json.extract! room, :id, :number, :reservation_id
  json.url room_url(room, format: :json)
end
