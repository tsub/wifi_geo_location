require 'faraday'
require 'json'

require 'wifi_geo_location/wifi_detail'
require 'wifi_geo_location/client'
require 'wifi_geo_location/version'

module WifiGeoLocation
  def self.find(key: nil)
    wifi_details = WifiGeoLocation::WifiDetail.scan

    request_params = { wifiAccessPoints: [] }
    wifi_details.each do |detail|
      request_params[:wifiAccessPoints] << {
        macAddress: detail[:mac_address],
        signalStrength: detail[:signal_strength],
        channel: detail[:channel]
      }
    end

    client = WifiGeoLocation::Client.new(key: key)
    response = client.post(request_params)
  end
end
