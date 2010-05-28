require 'rubygems'
require 'sinatra/base'
require 'mustache/sinatra'

class KetchupStatus
  class Server < Sinatra::Base
    register Mustache::Sinatra

    set :logging, :true
    set :public, File.dirname(__FILE__) + '/static'

    set :mustache, {
      :views     => 'lib/views/',
      :templates => 'lib/templates/'
    }

    set :namespace, KetchupStatus::Server

    def initialize(*args)
      super
    end

    get '/' do
      "Hello World!"
    end

    get '/:office' do
      @office = params[:office]
      @image = "ketchup_empty.png"
      mustache :status, :office => @office, :image => @image
    end






  end
end
