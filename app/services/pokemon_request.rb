# require 'pry-rails'
class PokemonRequest
  URL="https://pokeapi.co/api/v2/"
  # class << self

  def self.get_pokemon(pokemon)
    response =Faraday.get(URL+"pokemon/#{pokemon}")
    if response.status==200
      row_data=parsed_data(response)
    else
      row_data= nil
      return row_data
    end
    end

  def self.get_all_pokemons
    pokemons=[]
    response=Faraday.get(URL+"pokemon?limit=30")
     @row_data=JSON.parse(response.body)
    @row_data.each do |key, value|
     if key=="results"
    value.each do |k, v|
      response=Faraday.get(k["url"])
     @response=parsed_data(response)
     pokemons<<@response
     end
     end
    end
    @pokemons=pokemons
  end

  private
  def self.parsed_data(response)
    JSON.parse(response.body, symbolize_names:true)
  end
end
