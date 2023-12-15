require 'faraday'

class SearchController < ApplicationController
  def index
    nation = params[:nation]
    @nation = nation.gsub('+', ' ').titleize

    conn = Faraday.new(url: "https://last-airbender-api.fly.dev")
    # require 'pry'; binding.pry
    response = conn.get("/api/v1/characters?perPage=100&affiliation=#{nation}")
    json = JSON.parse(response.body, symbolize_names: true)
    @members = json.map do |member|
      member[:allies] = allies(member[:allies])
      member[:enemies] = enemies(member[:enemies])
      member
    end
  end
  private

  def allies(allies)
    if allies != []
      allies.join(', ')
    else
      return "None"
    end
  end
  def enemies(enemies)
    if enemies != []
      enemies.join(', ')
    else
      return "None"
    end
  end
end
