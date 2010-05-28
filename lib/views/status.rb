class KetchupStatus
  class Server
    module Views
      class Status < Mustache
        def office
          "FooOffice"
        end

        def image
          "foo.png"
        end
      end
    end
  end
end
