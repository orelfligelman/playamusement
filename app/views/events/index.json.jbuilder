json.array!(@events) do |event|
  json.extract! event, :id, :summary, :location, :description, :start_date, :timezone, :end_date, :attendees
  json.url event_url(event, format: :json)
end
