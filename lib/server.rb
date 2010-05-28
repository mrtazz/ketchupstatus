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
      @offices = Hash.new
    end

    get '/' do
      "Hello World!"
    end

    get '/:office' do
      @office = params[:office]
      @value = @offices[params[:office]]
      @image = @offices[params[:office]]
      mustache :status, :office => @office, :image => @image, :value => @value
    end

    post '/:office/:value' do
      @offices[params[:office]] = params[:value]
      "You would've set the bottle for #{params[:office]} to #{params[:value]}!"
    end






  end
end
