class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'

    puts "params #{params}"
    if params[:lat_long].present?
      @lat_lang = params[:lat_long].split("|")
      @url =
          "http://api.openweathermap.org/data/2.5/weather?lat=#{@lat_lang[0]}&lon=#{@lat_lang[1]}&appid=#{Rails.application.credentials[:openweather][:API_KEY]}&units=imperial"
      @uri = URI(@url)
      @response = Net::HTTP.get(@uri)
      @output = JSON.parse(@response)
    end
  end

  def zipcode

  end
end
