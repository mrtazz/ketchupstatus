class KetchupStatus
  module Views
    class Confirm < Mustache
      def name
        @name
      end

      def token
        @token
      end

      def url
        @name.to_s + "/" + @token.to_s
      end
    end
  end
end
