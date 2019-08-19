require 'net/http'
require 'uri'

require_relative './connection'

module Blockmason
  module Link
    class Provider
      def self.default_url
        'https://api.block.mason.link'
      end

      def connect!(base_url = ::Blockmason::Link::Provider.default_url)
        uri = URI(base_url)

        Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
          ::Blockmason::Link::Connection.new(base_url: base_url, http: http)
        end
      end
    end
  end
end
