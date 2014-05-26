module Bluemoon
  class Bluetooth
    def self.off
      power(0)
    end

    def self.on
      power(1)
    end

    def self.power(flag)
      unless `blueutil power`.to_i == flag.to_i
        `blueutil power #{flag}`

        true
      end
    end
  end
end
