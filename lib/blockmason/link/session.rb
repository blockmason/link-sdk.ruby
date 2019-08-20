require 'json'
require 'net/http'
require 'uri'

module Blockmason
  module Link
    class Session
      def initialize(access_token:, base_url:, http:, refresh_token:)
        @access_token = access_token
        @base_url = base_url
        @http = http
        @refresh_token = refresh_token
      end

      def get(path, inputs = {})
        query = URI.encode_www_form(inputs)
        query = "?#{query}" unless query.empty?

        url = "#{@base_url}/v1#{path}#{query}"
        request = Net::HTTP::Get.new(url)

        request['Authorization'] = "Bearer #{@access_token}"

        response = @http.request(request)

        outputs = JSON.parse(response.body)

        outputs
      end

      def post(path, inputs = {})
        request = Net::HTTP::Post.new("#{@base_url}/v1#{path}")

        request['Content-Type'] = 'application/json'
        request['Authorization'] = "Bearer #{@access_token}"

        response = @http.request(request, inputs.to_json)

        outputs = JSON.parse(response.body)

        outputs
      end

      def refresh!
        request = Net::HTTP::Post.new("#{@base_url}/oauth2/token")

        request['Content-Type'] = 'application/json'

        response = @http.request(request, {
          grant_type: 'refresh_token',
          refresh_token: @refresh_token
        }.to_json)

        grant = JSON.parse(response.body)

        raise response.body if grant.has_key?('errors')

        self.new(access_token: grant['access_token'], base_url: @base_url, http: @http, refresh_token: grant['refresh_token'])
      end
    end
  end
end
