require_relative './provider'

module Blockmason
  module Link
    ##
    # The entry-point for most apps to integrate with a \Blockmason \Link project.
    class Project
      ##
      # Initialize a \Project with your \Link project's +client_id+ and +client_secret+.
      # Optionally, you can provide an alternative +base_url+ here. For example,
      # if mocking server responses for an integration test suite, or if using
      # a Link-compatible API provider.
      def initialize(base_url: ::Blockmason::Link::Provider.default_url, client_id:, client_secret:)
        @base_url = base_url
        @client_id = client_id
        @client_secret = client_secret
      end

      ##
      # Performs a GET request against a \Link project's API at the given +path+
      # and with the given optional +inputs+. Returns the outputs returned for
      # the API call.
      def get(path, inputs = {})
        session.get(path, inputs)
      end

      ##
      # Performs a POST request against a \Link project's API at the given +path+
      # and with the given optional +inputs+. Returns the outputs returned for
      # the API call.
      def post(path, inputs = {})
        session.post(path, inputs)
      end

    private
      def connection
        @connection ||= connection!
      end

      def provider
        @provider ||= provider!
      end

      def session
        @session ||= session!
      end

      def connection!
        @connection = provider.connect!(@base_url)
        @connection
      end

      def provider!
        @provider = ::Blockmason::Link::Provider.new
        @provider
      end

      def session!
        @session = connection.authenticate!(client_id: @client_id, client_secret: @client_secret)
        @session
      end
    end
  end
end
