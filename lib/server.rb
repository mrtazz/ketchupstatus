require 'rubygems'
require 'sinatra/base'
require 'mustache/sinatra'

class KetchupStatus
  class Server < Sinatra::Base
    register Mustache::Sinatra
    set :logging, :true
    set :public, File.dirname(__FILE__) + '/static'
    set :views, "lib/templates/"
    set :mustaches, "lib/views/"


    get '/' do
      "Hello World!"
    end

    get '/:office' do
      "Hello #{params[:office]}!"
    end






  end
end
