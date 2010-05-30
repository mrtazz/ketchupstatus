class KetchupStatus
  class Server
    module Views
      class Status < Mustache
        def office
          "FooOffice"
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
end
