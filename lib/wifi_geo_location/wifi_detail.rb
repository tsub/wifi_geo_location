module WifiGeoLocation
  class WifiDetail
    def self.scan
      lines = `/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -s`.split(/[\r\n]/)
      lines.shift
      lines.map do |i|
        a = i.scan(/[^\s]+/)
        { mac_address: a[1], signal_strength: a[2].to_i, channel: a[3].to_i }
      end
    end
  end
end
