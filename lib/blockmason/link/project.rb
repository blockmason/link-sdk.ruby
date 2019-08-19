require_relative './provider'

module Blockmason
  module Link
    class Project
      attr_accessor :base_url, :client_id, :client_secret, :connection, :provider, :session

      def initialize(base_url: ::Blockmason::Link::Provider.default_url, client_id:, client_secret:)
        @base_url = base_url
        @client_id = client_id
        @client_secret = client_secret
      end

      def get(path, inputs = {})
        session.get(path, inputs)
      end

      def post(path, inputs = {})
        session.post(path, inputs)
      end

    protected
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

