require 'rubygems'
require 'dm-core'

class KetchupStatus
### Data definitions
  module Data

    base_dir = File.dirname(__FILE__) + '/../'
    DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/db/db.sqlite")

    class Office
      include DataMapper::Resource

      property :id, Serial
      property :office, String
      property :status, Integer
      property :api_key, String
    end

    DataMapper.auto_migrate!
  end
end
