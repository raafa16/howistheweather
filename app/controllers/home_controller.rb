class HomeController < ApplicationController
  def geolocation
    require 'net/http'
    require 'json'

    if params[:lat_long].present?
      @lat_lang = params[:lat_long].split("|")
      weather_url =
          "http://api.openweathermap.org/data/2.5/weather?lat=#{@lat_lang[0]}&lon=#{@lat_lang[1]}&appid=#{Rails.application.credentials[:openweather][:API_KEY]}&units=imperial"
      @weather_output = JSON.parse(Net::HTTP.get(URI(weather_url)))
      forecast_url = "http://api.openweathermap.org/data/2.5/forecast?lat=#{@lat_lang[0]}&lon=#{@lat_lang[1]}&cnt=9&appid=#{Rails.application.credentials[:openweather][:API_KEY]}&units=imperial"
      @forecast_output = JSON.parse(Net::HTTP.get(URI(forecast_url)))
    end
  end

  def zipcode
    if params[:zipcode].present?
      @url =
          "http://api.openweathermap.org/data/2.5/weather?zip=#{params[:zipcode]},us&appid=#{Rails.application.credentials[:openweather][:API_KEY]}&units=imperial"
      @weather_output = JSON.parse(Net::HTTP.get(URI(@url)))
    end
  end
end
