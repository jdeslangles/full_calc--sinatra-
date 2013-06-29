require 'pry'
require 'sinatra'
require 'sinatra/contrib/all'

get '/' do
  erb :home
end


get '/basic_calc' do
  @first = params[:first].to_f
  @second = params[:second].to_f
  @operator = params[:operator]

  @result = case @operator
                  when "+" then @first + @second
                  when "-" then @first - @second
                  when "*" then @first * @second
                  when "/" then @first / @second
                  end

  erb :basic_calc
end

get '/bmi_calc' do
  if params[:weight_pounds].to_f > 0 && params[:height_inches].to_f > 0

  @weight_pounds = params[:weight_pounds].to_f
  @height_inches = params[:height_inches].to_f
  @result_pounds = (@weight_pounds/(@height_inches**2))*703

  else params[:weight_kilos].to_f > 0 && params[:height_cm].to_f > 0

  @weight_kilos = params[:weight_kilos].to_f
  @height_cm = params[:height_cm].to_f
  @result_kilos = (@weight_kilos/(@height_cm**2))
  end

  erb :bmi_calc
end

get '/mortgage_calc' do
if params.any?
  @principal = params[:principal].to_f
  @yearly_rate = (params[:yearly_rate].to_f/1200)
  @payment_number = params[:payment_number].to_f
  x=(1+@yearly_rate)**@payment_number
  @mortgage_result = (@principal*@yearly_rate*x/(x-1))
end
  erb :mortgage_calc
end


def mpg_utility(speed, mpg)
  if speed > 60
    mpg - ((speed - 60) * 2)
  else
    mpg
  end
end

get '/trip_calc' do
if params.any?
@distance = params[:distance].to_f
@mpg = params[:mpg].to_f
@price = params[:price].to_f
@speed = params[:speed].to_f
mpg = mpg_utility(@speed, @mpg)
@result_time = @distance/@speed
@result_cost = (@distance/mpg)*@price
end
  erb :trip_calc
end