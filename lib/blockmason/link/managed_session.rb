require_relative './session'

module Blockmason
  module Link
    class ManagedSession
      attr_accessor :session

      def initialize(session:)
        @session = session
      end

      def post(path, inputs)
        begin
          @session.post(path, inputs)
        rescue error
          if error["errors"].any? { |it| it['detail'] =~ /Authentication failed/ }
            @session = @session.refresh!
            @session.post(path, inputs)
          else
            raise error
          end
        end
      end

      def get(path, inputs)
        begin
          @session.get(path, inputs)
        rescue error
          if error["errors"].any? { |it| it['detail'] =~ /Authentication failed/ }
            @session = @session.refresh!
            @session.get(path, inputs)
          else
            raise error
          end
        end
      end
    end
  end
end
