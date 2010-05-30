class KetchupStatus
  module Views
    class Status < Layout
      def office
        @office || "FooOffice"
      end

      def image
        @image || "0"
      end

      def value
        @value || "0"
      end
    end
  end
end
