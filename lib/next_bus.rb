require 'pry'
require 'net/http'
require 'uri'
require 'json'
require 'time'

module NextBus
  BASE_URI                       = 'http://nextbus.jt2k.com/api/route/'
  DIRECTION                      = '/dir/1/stop/'
  PARAMS                         = "?key=#{ENV['NEXT_BUS_API_KEY']}"
  CHARLOTTE_AND_46TH_STOP_ID     = 'CXIRICHL'
  WEST_END_AND_ELMINGTON_STOP_ID = 'WESELMEN'
  STOP_MAP = {
    '3'  => WEST_END_AND_ELMINGTON_STOP_ID,
    '5'  => WEST_END_AND_ELMINGTON_STOP_ID,
    '10' => CHARLOTTE_AND_46TH_STOP_ID
  }

  class << self
    attr_accessor :uri

    def three
      next_stop 3
    end

    def five
      next_stop 5
    end

    def ten
      next_stop 10
    end

    private
    def next_stop(line_no)
      set_uri line_no.to_s
      stop = upcoming_stops.first || first_stop_of_day
      stop['arrival_time_str']
    end

    def upcoming_stops
      all_stops.select { |stop| Time.parse(stop['arrival_time']) > now.yield }
    end

    def all_stops
      parse_body['times']
    end

    def first_stop_of_day
      all_stops.first
    end

    def parse_body
      JSON.parse api_response
    end

    def api_response
      response(uri).body
    end

    def set_uri(line_no='')
      @uri = URI.parse(BASE_URI + line_no + DIRECTION + STOP_MAP[line_no] + PARAMS)
    end

    def response(uri)
      Net::HTTP.get_response uri
    end

    def now
      -> { Time.now }
    end
  end
end
