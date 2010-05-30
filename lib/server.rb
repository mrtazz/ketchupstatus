require 'rubygems'
require 'sinatra/base'
require 'mustache/sinatra'
require 'lib/data'

class KetchupStatus

  class Server < Sinatra::Base
    register Mustache::Sinatra

    require Dir.pwd + '/views/layout'

    set :logging, :true
    set :root, File.dirname(__FILE__)
    set :public, "#{Dir.pwd}/static"

    set :mustache, {
      :views     => "#{Dir.pwd}/views/",
      :templates => "#{Dir.pwd}/templates/",
      :namespace => KetchupStatus
    }

    get '/' do
      mustache :index
    end

    get '/offices/:office' do
      puts ":office param " + params[:office].to_s
      o = KetchupStatus::Data::Office.first(:office => params[:office].to_s)
      puts "Office obj "
      puts o
      if o
        puts "office.office " + o.office
        puts "office.status " + o.status.to_s
        @office = o.office
        @image = o.status.to_s
        @value = o.status.to_s
        mustache :status
      else
        404
      end
    end

    post '/offices/:office/:value' do
      office = KetchupStatus::Data::Office.first(:office => params[:office].to_s)
      if office then
        office.status = params[:value].to_i
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
