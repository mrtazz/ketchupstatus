require 'rubygems'
require 'sinatra/base'
require 'mustache/sinatra'
require 'digest/md5'
require 'lib/data'

class KetchupStatus

  class Server < Sinatra::Base
    register Mustache::Sinatra

    base = File.dirname(__FILE__) + "/.."

    set :logging, :true
    set :root, File.dirname(__FILE__)
    set :public, "#{base}/static"
    require base + '/views/layout'

    set :mustache, {
      :views     => "#{base}/views/",
      :templates => "#{base}/templates/",
      :namespace => KetchupStatus
    }

    # index page
    get '/' do
      mustache :index
    end

    # get status
    get '/ketchup/:office' do
      o = KetchupStatus::Data::Office.first(:office => params[:office].to_s)
      if o
        @office = o.office
        @image = o.status.to_s
        @value = o.status.to_s
        mustache :status
      else
        404
      end
    end

    # status update webform
    get '/ketchup/:office/:token' do
      office = KetchupStatus::Data::Office.first(:office => params[:office].to_s)
      if office and params[:token].to_s.eql? office.token.to_s
        @name = params[:office].to_s
        @token = params[:token].to_s
        mustache :update
      else
        404
      end
    end

    # update value
    post '/ketchup/:office/:token/:value' do
      office = KetchupStatus::Data::Office.first(:office => params[:office].to_s)
      if office and params[:token].to_s.eql? office.token.to_s
        # set to allowed values
        value = 100 if params[:value].to_i >= 100
        value = 75 if params[:value].to_i >= 75 and params[:value].to_i < 100
        value = 50 if params[:value].to_i >= 50 and params[:value].to_i < 75
        value = 25 if params[:value].to_i >= 25 and params[:value].to_i < 50
        value = 0 if params[:value].to_i < 25
        # set value and store
        office.status = value
        office.save
        "Update successful!"
      else
        403
      end
    end

    # create new office
    post '/ketchup/:office' do
      office = KetchupStatus::Data::Office.first(:office => params[:office].to_s)
      if office
        "Office exists already. Please choose another name."
      else
        o = KetchupStatus::Data::Office.new
        o.office = params[:office]
        o.status = 0
        o.token = Digest::MD5.hexdigest(Time.now.to_s + rand.to_s + params[:office]).to_s
        o.save
        @name = o.office.to_s
        @token = o.token.to_s

        mustache :confirm, :layout => false
      end
    end

  end

end
