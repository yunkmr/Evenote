json.array!(@events) do |event|
  json.id event.id
  json.date event.date
  json.name event.name
  json.start sevent.date
  json.end event.date
end