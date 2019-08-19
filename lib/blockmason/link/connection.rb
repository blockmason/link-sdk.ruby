require 'json'
require 'net/http'

require_relative './managed_session'
require_relative './session'

module Blockmason
  module Link
    class Connection
      attr_accessor :base_url, :http

      def initialize(base_url:, http:)
        @base_url = base_url
        @http = http
      end

      def authenticate!(client_id:, client_secret:)
        request = Net::HTTP::Post.new("#{@base_url}/oauth2/token")

        request['Content-Type'] = 'application/json'

        response = @http.request(request, {
          client_id: client_id,
          client_secret: client_secret,
          grant_type: 'client_credentials'
        }.to_json)

        grant = JSON.parse(response.body)

        raise response.body if grant.has_key?('errors')

        session = ::Blockmason::Link::Session.new(access_token: grant['access_token'], base_url: @base_url, http: @http, refresh_token: grant['refresh_token'])

        ::Blockmason::Link::ManagedSession.new(session: session)
      end
    end
  end
end
