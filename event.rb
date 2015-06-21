event = {
  'summary' => 'Google I/O 2015',
  'location' => '800 Howard St., San Francisco, CA 94103',
  'description' => 'A chance to hear more about Google\'s developer products.',
  'start' => {
    'dateTime' => '2015-05-28T09:00:00-07:00',
    'timeZone' => 'America/Los_Angeles',
  },
  'end' => {
    'dateTime' => '2015-05-28T17:00:00-07:00',
    'timeZone' => 'America/Los_Angeles',
  },
  'recurrence' => [
    'RRULE:FREQ=DAILY;COUNT=2'
  ],
  'attendees' => [
    {'email' => 'lpage@example.com'},
    {'email' => 'sbrin@example.com'},
  ],
  'reminders' => {
    'useDefault' => false,
    'overrides' => [
      {'method' => 'email', 'minutes' => 24 * 60},
      {'method' => 'sms', 'minutes' => 10},
    ],
  },
}

results = client.execute!(
  :api_method => calendar_api.events.insert,
  :parameters => {
    :calendarId => 'primary'},
  :body_object => event)
event = results.data
puts "Event created: #{event.htmlLink}"

rails g scaffold events summary:string location:string description:string start_date:datetime timezone:string end_date:datetime attendees:string 