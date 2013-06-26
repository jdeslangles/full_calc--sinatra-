require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?

get '/hi' do
  "Hello, WDI!"
end


