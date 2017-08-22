class SearchController < ApplicationController

  def index
    state = params[:state]

    @conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
      faraday.headers["X-API-KEY"] = ENV["propublica_key"]
      faraday.adapter Faraday.default_adapter
      #faraday adapter is now the default adapter
    end
    response = @conn.get("/congress/v1/members/house/#{state}/current.json")
    @members = JSON.parse(response.body, symbolize_names: true)[:results]

    @members = @members.map do |attribs|
      Member.new(attribs)
    end
  end
end
