require 'rubygems'
require 'sinatra'
require 'haml'
require 'rack-livereload'
require 'thread'

use Rack::LiveReload, :source => :vendored

Thread.new { system("bundle exec guard &>/dev/null") }

get '/app.css' do
  scss :'app', :views => "./public/stylesheets"
end

get '/' do
  haml :index
end

get '/partial' do
  haml :partial
end
