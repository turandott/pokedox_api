require 'json'
class PokemonController < ApplicationController

  def index
    pokemons=[]
    url='https://pokeapi.co/api/v2/pokemon'
    response=Faraday.get(url,max_response: 10)
     @row_data=JSON.parse(response.body)
    @row_data.each do |key, value|
      if key=="results"
        value.each do |k, v|
          response=Faraday.get(k["url"])
          response=JSON.parse(response.body)
          pokemons<<response
        end
      end
    end
    @pokemons=@row_data['results'].map{ |n| n['name']}

    # @pokemon_json=pokemons.map do |pokemon|
      # Pokemon.new(img:pokemon['sprites']['other']['dream_world']["front_default"], name: pokemon['forms'][0]['name'], weight: pokemon['weight'], poke_type: pokemon['types'][0]['type']['name'], poke_ability: pokemon['abilities'][0]['ability']['name'], poke_id: pokemon['id'])
    end
    # render json: { pokemons: @pokemon_json }
  # end

    # pokemon=gets.strip.upcase
    #
    # found=pokemons.select do |pokemon|
    #   pokemon.upcase.include?(pokemon)
    # end
    # puts found.first
  def new
    return if params[:search].blank?
    raw_response = Faraday.get "https://pokeapi.co/api/v2/pokemon/#{params[:search]}"
    if raw_response.status == 200
      @response = JSON.parse(raw_response.body)
    else
      redirect_to new_pokemon_path, notice: "#{raw_response.status}error!"
    end
  end
  end

