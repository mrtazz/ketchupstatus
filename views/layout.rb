class KetchupStatus
  module Views
    class Layout < Mustache

      def title
        @title || "Ketchup Status"
      end

    end
  end
end
