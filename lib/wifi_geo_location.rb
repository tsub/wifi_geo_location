require 'faraday'
require 'json'

require 'wifi_geo_location/wifi_tower'
require 'wifi_geo_location/client'
require 'wifi_geo_location/version'

module WifiGeoLocation
  def self.find(key: nil)
    client = WifiGeoLocation::Client.new(key: key)

    wifi_towers = WifiGeoLocation::WifiTower.scan

    request_params = {
      wifiAccessPoints: wifi_towers.map do |tower|
        {
          macAddress: tower[:mac_address],
          signalStrength: tower[:signal_strength],
          channel: tower[:channel]
        }
      end
    }

    client.post(request_params)
  end
end
