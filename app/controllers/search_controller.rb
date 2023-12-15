require 'faraday'

class SearchController < ApplicationController
  def index
    nation = params[:nation]
    @nation = nation.gsub('+', ' ').titleize

    conn = Faraday.new(url: "https://last-airbender-api.fly.dev")
    # require 'pry'; binding.pry
    response = conn.get("/api/v1/characters?perPage=100&affiliation=#{nation}")
    json = JSON.parse(response.body, symbolize_names: true)
    @members = json
    # require 'pry'; binding.pry
  end
end