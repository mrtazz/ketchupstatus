class KetchupStatus
  module Views
    class Index < Layout
      def headline
        @headline || "Ketchup Status"
      end
      def byline
        @byline || "Status of shared Ketchup resources."
      end
    end
  end
end
