require 'pry-rails'
class PokemonRequest
  URL="https://pokeapi.co/api/v2/"
  # class << self

  def self.get_pokemon
    # binding.pry

    response =Faraday.get(URL+"pokemon/1")
    # binding.pry

    # response =Faraday.get("https://pokeapi.co/api/v2/pokemon/1")
    @row_data=parsed_data(response)

  end

  def self.get_all_pokemons
    pokemons=[]
    response=Faraday.get(URL+"pokemon?limit=5")
     @row_data=JSON.parse(response.body)
    @row_data.each do |key, value|
     if key=="results"
    value.each do |k, v|
      response=Faraday.get(k["url"])
     @response=JSON.parse(response.body)
     pokemons<<@response
     end
     end
    end
    @pokemons=pokemons
  end

  # def self.create_pokemon(data)
  #   create(
  #     name: data.name,
  #     order: data.order,
  #     image_url: data.image_url,
  #     weight: data.weight,
  #     pokemon_type: data.pokemon_type
  #   )
  # end
  private
  def self.parsed_data(response)
    JSON.parse(response.body, symbolize_names:true)
  end
end
