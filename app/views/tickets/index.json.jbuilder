json.array!(@tickets) do |ticket|
  json.id ticket.id
  json.title ticket.event_name
  json.start ticket.entry_start_date
  json.start ticket.win_date
  json.start ticket.payment_date
  json.end ticket.entry_start_date
  json.end ticket.win_date
  json.end ticket.payment_date
end