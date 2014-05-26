module Bluemoon
  class Location < Struct.new(:coordinates)
    class << self
      def current
        @@current ||= self.new(JSON.parse(`get-location -f json`)['coordinates'])
      end

      def debug
        puts "Querying location. This generally takes 10-20 seconds. Press any key to skip."

        Thread.new do
          display_debug_message(
            Area.all.join(', '),
            Area::PROXIMITY,
            current.to_s,
          )

          Kernel.exit
        end

        if $stdin.gets.length > 0
          display_debug_message(Area.all.join(', '),
            Area::PROXIMITY)
        end
      end

      def display_debug_message(office, proximity, location = 'Skipped', distance = '?', in_range = 'Maybe')
         puts <<-DEBUG

    Office:     #{office}
    Proximity:  You must be #{proximity} meters from the office to enable bluetooth.
    Location:   #{location}
    Distance:   #{distance} meters
    In range:   #{in_range}

          DEBUG
      end
    end

    # Kindly stolen wholesale from
    # http://stackoverflow.com/a/12969617/615412
    def distance(from)
      a, b = coordinates.dup, from

      rad_per_deg = Math::PI/180  # PI / 180
      rkm = 6371                  # Earth radius in kilometers
      rm = rkm * 1000             # Radius in meters

      dlon_rad = (b[1]-a[1]) * rad_per_deg  # Delta, converted to rad
      dlat_rad = (b[0]-a[0]) * rad_per_deg

      lat1_rad, lon1_rad = a.map! {|i| i * rad_per_deg }
      lat2_rad, lon2_rad = b.map! {|i| i * rad_per_deg }

      a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
      c = 2 * Math.asin(Math.sqrt(a))

      rm * c # Delta in meters
    end

    def open
      `open #{url}`
    end

    def to_s
      "#{coordinates.join(', ')}"
    end

    def url
      "https://www.google.com/maps/@#{coordinates.join(',')},15z"
    end
  end
end
