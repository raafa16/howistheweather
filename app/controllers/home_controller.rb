class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'

    @url =
      "http://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=46239&distance=25&API_KEY=#{ENV["airnow_api_key"] ||  Rails.application.credentials[:airnow][:API_KEY]}"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)
  end
end
