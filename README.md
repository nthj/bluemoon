# bluemoon

Enable or disable bluetooth on OS X based on your current location


## Why?

I use bluetooth on my Mac at the office for my wireless keyboard and mouse. At home or at the coffee shop, however, I don't use bluetooth at all. So bluetooth is generally running, and: 

* draining my battery
* interfering with my wireless connection

until I remember to turn it off. And then, of course, I have to turn it back on at the office. 

Bluemoon will handle powering your MacBook's bluetooth connection based on your location.

## Installation

I'm currently working on a homebrew recipe. Until then:

```
brew install blueutil
brew install sleepwatcher
brew install terminal-notifier
gem install bluemoon --no-wrappers
```

## Configuration

You'll probably want `bluemoon bootup` to run everytime you reboot:

```
crontab -e
@reboot bluemoon bootup
```

To be useful, you'll need to add at least one location you want Bluetooth enabled.  

```
bluemoon add # current location
```


## TODO

* Add IP address or router Mac address support
* Create a homebrew recipe
* Vendor `get-location` properly so it installs without the `--no-wrappers` flag
* Create a homebrew recipe so `brew install bluemoon` works


## Acknowledgements

The [get-location helper](https://github.com/lindes/get-location) was created by [@lindes](https://github.com/lindes).  Thank you.

[@jonahaaron](https://github.com/jonahaaron) proposed IP-address support.
