require 'rubygems'
require 'dm-core'

class KetchupStatus
### Data definitions
  module Data

    DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/db/db.sqlite")

    class Office
      include DataMapper::Resource

      property :id, Serial
      property :office, String
      property :status, Integer
      property :token, String
    end

    DataMapper.auto_upgrade!
  end
end
