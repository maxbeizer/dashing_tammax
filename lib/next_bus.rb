require 'net/http'
require 'uri'
require 'json'
require 'time'

module NextBus
  BASE_URI                       = 'http://nextbus.jt2k.com/api/stop/'
  PARAMS                         = "?key=#{ENV['NEXT_BUS_API_KEY']}"
  CHARLOTTE_AND_46TH_STOP_ID     = 'CXIRICHL'
  WEST_END_AND_ELMINGTON_STOP_ID = 'WESELMEN'

  class << self
    attr_accessor :uri

    def west_end
      next_stop WEST_END_AND_ELMINGTON_STOP_ID
    end

    def charlotte
      next_stop CHARLOTTE_AND_46TH_STOP_ID
    end

    private
    def next_stop(stop_id)
      set_uri stop_id
      stop = upcoming_stops.first || first_stop_of_day
      "#{stop['arrival_time_str']} (#{stop['route_id']})"
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

    def set_uri(stop_id='')
      @uri = URI.parse(BASE_URI + stop_id + PARAMS)
    end

    def response(uri)
      Net::HTTP.get_response uri
    end

    def now
      -> { Time.now }
    end
  end
end
