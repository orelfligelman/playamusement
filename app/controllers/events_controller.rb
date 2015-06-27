  class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json

require 'google/api_client'
require 'google/api_client/client_secrets'
require 'google/api_client/auth/installed_app'
require 'google/api_client/auth/storage'
require 'google/api_client/auth/storages/file_store'
require 'fileutils'

APPLICATION_NAME = 'Play Amusement'
CLIENT_SECRETS_PATH = 'client_secret.json'
CREDENTIALS_PATH = File.join(Dir.home, '.credentials',
                             "calendar-quickstart.json")
SCOPE = 'https://www.googleapis.com/auth/calendar'


def authorize
  FileUtils.mkdir_p(File.dirname(CREDENTIALS_PATH))

  file_store = Google::APIClient::FileStore.new(CREDENTIALS_PATH)
  storage = Google::APIClient::Storage.new(file_store)
  auth = storage.authorize

  if auth.nil? || (auth.expired? && auth.refresh_token.nil?)
    app_info = Google::APIClient::ClientSecrets.load(CLIENT_SECRETS_PATH)
    flow = Google::APIClient::InstalledAppFlow.new({
      :client_id => app_info.client_id,
      :client_secret => app_info.client_secret,
      :scope => SCOPE})
    auth = flow.authorize(storage)
    puts "Credentials saved to #{CREDENTIALS_PATH}" unless auth.nil?
  end
  auth
  puts "reached me" * 100
end

def check_upcoming_events
# Initialize the API
client = Google::APIClient.new(:application_name => APPLICATION_NAME)
client.authorization = authorize
calendar_api = client.discovered_api('calendar', 'v3')

# Fetch the next 10 events for the user
results = client.execute!(
  :api_method => calendar_api.events.list,
  :parameters => {
    :calendarId => 'primary',
    :maxResults => 10,
    :singleEvents => true,
    :orderBy => 'startTime',
    :timeMin => Time.now.iso8601 })
puts "Upcoming events:"
puts "No upcoming events found" if results.data.items.empty?
results.data.items.each do |event|
  start = event.start.date || event.start.date_time
  puts "- #{event.summary} (#{start})"
 end
end


def create_event
client = Google::APIClient.new(:application_name => APPLICATION_NAME)
client.authorization = authorize
calendar_api = client.discovered_api('calendar', 'v3')
event = {
  'summary' => @event.summary,
  'location' => @event.location,
  'description' => @event.description,
  'start' => {
    'dateTime' => '2015-08-29T09:00:00-07:00',
    'timeZone' => 'America/Los_Angeles',
  },
   'end' => {
    'dateTime' => '2015-08-30T17:00:00-07:00',
    'timeZone' => 'America/Los_Angeles',
  },
  'recurrence' => [
    'RRULE:FREQ=DAILY;COUNT=2'
  ],
  'attendees' => [
    {'email' => current_user.email},
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
end

<<<<<<< HEAD
=======

>>>>>>> stripe
  def index
    # authorize
   # check_upcoming_events
    @events = Event.all.order(start_date: :asc, created_at: :asc)
    # @packages = Packages.all 
  end
  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
    1.times {@event.orders.build}
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        # authorize
        create_event
        # calendars
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:summary, :location, :description, :start_date, :timezone, :end_date, :attendees)
    end
end
