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

def service
  @service ||= client.discovered_api('calendar', 'v3')
end

def search(page_token=nil)
  params = {
    'calendarId' => 'aidan.feldman@gmail.com',
    'q' => 'Artichoke rehearsal',
    'timeMin' => '2014-01-14T00:00:00Z'
  }
  params['pageToken'] = page_token if page_token
  client.execute(
    :api_method => service.events.list,
    :parameters => params
  )
end

setup!

# https://developers.google.com/google-apps/calendar/v3/reference/events/list#examples
page_token = nil
total_seconds = 0
loop do
  result = search(page_token)
  events = result.data.items

  events.each do |event|
    duration = event.end.dateTime - event.start.dateTime
    total_seconds += duration
  end

  page_token = result.data.next_page_token
  break if !page_token
end

total_hours = total_seconds.to_f / 60 / 60
total_rehearsals = total_hours / 2
puts "Total rehearsals: #{total_rehearsals}"
