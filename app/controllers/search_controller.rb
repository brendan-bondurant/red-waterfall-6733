require 'faraday'

class SearchController < ApplicationController
  def index
    nation = params[:nation]
    conn = Faraday.new(url: "https://last-airbender-api.fly.dev")
    require 'pry'; binding.pry
    response = conn.get("/api/v1/characters/?affiliation=#{nation}")
    json = JSON.parse(response.body, symbolize_names: true)
    @members = json
  end
end