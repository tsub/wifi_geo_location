module WifiGeoLocation
  class Client
    DEFAULT_HOST = 'www.googleapis.com'

    DEFAULT_HEADERS = {
      'Content-Type' => 'application/json'
    }

    DEFAULT_END_POINT = '/geolocation/v1/geolocate'

    def initialize(key: nil)
      @key = key
    end

    def post(request_params)
      faraday = Faraday.new(url: "#{url_prefix}?key=#{@key}")
      response = faraday.post do |request|
        request.url(DEFAULT_END_POINT)
        request.headers['Content-Type'] = DEFAULT_HEADERS['Content-Type']
        request.body = JSON.dump(request_params)
      end

      JSON.parse(response.body)
    end

    private

    def url_prefix
      "https://#{DEFAULT_HOST}"
    end
  end
end
