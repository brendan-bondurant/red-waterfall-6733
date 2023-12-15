require 'faraday'

class SearchController < ApplicationController
  def index
    nation = params[:nation]
    conn = Faraday.new(url: "https://last-airbender-api.fly.dev/api/v1/characters") do |faraday|
      faraday.headers["/?affiliation=#{nation}"] = "#{nation}"
    end
    response = conn.get
    require 'pry'; binding.pry
  end
end