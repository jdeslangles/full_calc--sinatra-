require 'pry'
require 'sinatra'
require 'sinatra/contrib/all'

get '/hi' do
  "Hello, WDI!"
end

get '/' do                  # a / on its own is the root of your site
  "this is the homepage"
end

get '/name/:first' do
  return "hello, #{params[:first]}"
  "oioi" # --> Careful!!! the last thing is what will be returned UNLESS you've specified what you want to return.
end