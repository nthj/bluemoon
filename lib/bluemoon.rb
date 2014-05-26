module Bluemoon
  autoload :Area,       'bluemoon/area'
  autoload :Bluetooth,  'bluemoon/bluetooth'
  autoload :Help,       'bluemoon/help'
  autoload :Location,   'bluemoon/location'
  autoload :Notify,     'bluemoon/notify'

  def self.bootup
    system "sleepwatcher --displaywakeup 'bluemoon run'"
  end

  def self.run
    # We disable Bluetooth up here,
    # because disabling it helps us connect to wifi faster
    just_disabled = Bluetooth.off

    if Area.all.any? { |area| area.contains?(Location.current) }
      Bluetooth.on

      just_disabled or  Notify.success('Enabling Bluetooth')
    else
      just_disabled and Notify.success('Disabling Bluetooth')
    end
  rescue
    Bluetooth.on
    Notify.handle($!)
  end
end
