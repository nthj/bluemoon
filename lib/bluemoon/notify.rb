module Bluemoon
  class Notify
    def self.handle(exception)
      "#{ENV['HOME']}/bluemoon-error-logs.txt".tap do |error_log|
        File.open(error_log, 'a') do |file|
          file.write exception.message
          file.write exception.backtrace.join("\n")
        end

        Notify.failure(
          "Failed to gather location, enabled bluetooth",
          "-execute 'open #{error_log}'"
        )
      end

      puts  exception.message
      puts *exception.backtrace
    end

    def self.success(message)
      puts message

      `terminal-notifier-success \
        -message "#{message}" \
        -title "Bluemoon" \
        -group bluemoon &>/dev/null`
    end

    def self.failure(message, flags = '')
      puts message

      `terminal-notifier-failed \
        -message "#{message}" \
        #{flags} \
        -title "Bluemoon" \
        -group bluemoon &>/dev/null`
    end
  end
end
