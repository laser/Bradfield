require 'faraday'
require 'httparty'

module Gossip
  class RequestService
    def self.get(url)
      ::HTTParty.get(url)
    rescue Errno::ECONNREFUSED
      puts "Could not connect to #{url}"
    end

    def self.post(url, body)
      ::HTTParty.post(url, {
        headers: { "Content-Type": 'application/json' },
        body: body.to_json
      })
    rescue Errno::ECONNREFUSED
      puts "Could not connect to #{url}"
    end
  end
end
