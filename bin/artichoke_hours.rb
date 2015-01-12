# usage:
# 1. Create new OAuth app at https://console.developers.google.com
# 2. "Download JSON", and save as client_secrets.json in this repo
# 3. Run `gem install google-api-client`
# 4. Run `ruby bin/artichoke_hours.json`

require 'google/api_client'
require 'time'

def client
  @client ||= Google::APIClient.new(
    :application_name => 'Ruby Calendar sample',
    :application_version => '1.0.0'
  )
end

def setup!
  client_secrets = Google::APIClient::ClientSecrets.load
  authorization = client_secrets.to_authorization
  authorization.scope = 'https://www.googleapis.com/auth/calendar.readonly'
  # http://stackoverflow.com/a/25694982/358804
  puts "Please visit: #{authorization.authorization_uri.to_s}"
  printf "Enter the code: code="
  code = gets
  authorization.code = code
  authorization.fetch_access_token!
  client.authorization = authorization
end

def to_datetime(time)
  if time.is_a?(String)
    DateTime.parse(time)
  else
    time
  end
end


setup!
service = client.discovered_api('calendar', 'v3')

# https://developers.google.com/google-apps/calendar/v3/reference/events/list#examples
# https://developers.google.com/api-client-library/ruby/guide/pagination
request = {
  api_method: service.events.list,
  parameters: {
    'calendarId' => 'aidan.feldman@gmail.com',
    'q' => 'Artichoke',
    'timeMin' => '2014-01-14T00:00:00Z'
  }
}
total_hours = 0
loop do
  result = client.execute(request)
  events = result.data.items

  events.each do |event|
    # for some reason, dates for all-day events are a different attribute, and are Strings
    start_at = to_datetime(event.start['dateTime'] || event.start['date'])
    end_at = to_datetime(event.end['dateTime'] || event.end['date'])

    if event.start['date']
      # don't count full-day events
      duration_hours = 0
    else
      duration_sec = end_at - start_at
      duration_hours = duration_sec.to_f / 60 / 60
    end

    case event.summary
    when 'Artichoke rehearsal', 'Artichoke tech'
      total_hours += duration_hours
    else
      puts [
        event.summary.ljust(30),
        start_at.strftime('%b %-d').ljust(12),
        "#{duration_hours} hours"
      ].join
    end
  end

  break unless result.next_page_token
  request = result.next_page
end

total_rehearsals = total_hours / 2
puts "Total rehearsals: #{total_rehearsals}"
