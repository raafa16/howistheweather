class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'

    puts "params #{params}"
    if params[:lat_long].present?
      @lat_lang = params[:lat_long].split("|")
    end
  end

  def zipcode
    @url =
        "http://api.openweathermap.org/data/2.5/weather?zip=#{zipcode},us&appid=#{Rails.application.credentials[:openweather][:API_KEY]}"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)
  end
end
