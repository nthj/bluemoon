module Bluemoon
  class Help
    def self.show
     puts <<-HELP

bluemoon
Enable or disable bluetooth on OS X based on your current location

  bootup   :: Runs `bluemoon run` whenever your display wakes up.
     add   :: Enable bluetooth at your current location
    list   :: List all locations where bluetooth is enabled
  remove # :: Remove the numbered location (e.g. `bluemoon remove 3`)
     run   :: Enable or disable bluetooth based on your proxmity to the location


   debug   :: Show current location and meters from office.
    help   :: Displays this help message.
    open   :: Open your current location in Google Maps

      HELP
    end
  end
end
