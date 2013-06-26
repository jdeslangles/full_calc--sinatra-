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
  "oioi"                      # --> Careful!!! the last thing is what will be returned UNLESS you've specified what you want to return.
end

get '/name/:first/:last/:age' do
  "your name is #{params[:first]} #{params[:last]}. you are #{params[:age]} years old"
end

get '/multiply/:x/:y' do
result = params[:x].to_f * params[:y].to_f
"the result is #{result}"
end

get '/divide/:x/:y' do
result = params[:x].to_f / params[:y].to_f
"the result is #{result}"
end