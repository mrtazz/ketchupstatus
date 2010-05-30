require 'rubygems'
require 'sinatra/base'
require 'mustache/sinatra'
require 'lib/data'

class KetchupStatus
  class Server < Sinatra::Base
    register Mustache::Sinatra

    @base_dir = File.dirname(__FILE__) + '/../'
    set :logging, :true
    set :public, @base_dir  + 'static'

    set :mustache, {
      :views     => @base_dir + 'views/',
      :templates => @base_dir + 'templates/'
    }

    set :namespace, KetchupStatus::Server

    def initialize(*args)
      super
      #@offices = Hash.new
    end

    get '/' do
      "Hello World!"
    end

    get '/:office' do
      office = KetchupStatus::Data::Office.first(:office => params[:office].to_s)
      puts office
      puts office.office
      puts office.status
      if office then
        mustache :status, :office => office.office,
                          :image => office.status,
                          :value => office.status
      else
        404
      end
    end

    post '/:office/:value' do
      office = KetchupStatus::Data::Office.first(:office => params[:office].to_s)
      if office then
        office.status = :value.to_i
        office.save
      else
        o = KetchupStatus::Data::Office.new
        o.office = params[:office]
        o.status = params[:value].to_i
        o.save
        "You would've set the bottle for #{params[:office]} to #{params[:value]}!"
      end
    end

  end
end
