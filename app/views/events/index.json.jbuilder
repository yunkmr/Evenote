json.array!(@calender_events) do |event|
  json.id event.id
  json.title event.name
  json.start event.date
  json.end event.date
end