module Bluemoon
  class Area < Struct.new(:coordinates)
    PROXIMITY = 400

    class << self
      def add
        puts "Querying location. This may take a few moments..."

        File.open(plist_filename, 'w+') do |file|
          file.write [*all, Location.current].map(&:coordinates).uniq.to_plist
        end

        puts "Added #{Location.current} to list of places to enable bluetooth at."
        puts Location.current.url
      end

      def all
        Array(Plist::parse_xml(plist_filename)).map do |area|
          self.new(area)
        end
      end

      def list
        all.each_with_index do |location, i|
          puts "#{(i + 1).to_s.ljust(all.count.to_s.length)}. #{location}"
        end
      end

      def plist_filename
        "#{ENV['HOME']}/Library/Preferences/com.bluemoon.locations"
      end

      def remove(i)
        File.open(plist_filename, 'w+') do |file|
          file.write all.tap { |a| a.delete(i.to_i - 1) }
        end

        list
      end
    end

    def contains?(location)
      location.distance(coordinates) < PROXIMITY
    end

    def to_s
      coordinates.join(', ')
    end
  end
end
