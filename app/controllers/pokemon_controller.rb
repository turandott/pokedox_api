require 'json'
class PokemonController < ApplicationController
  def index
    pokemons=[]
    url='https://pokeapi.co/api/v2/pokemon?limit=20'
    response=Faraday.get(url)
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

  def new
    return if params[:search].blank?
    raw_response = Faraday.get "https://pokeapi.co/api/v2/pokemon/#{params[:search]}"
    if raw_response.status == 200
      @response = JSON.parse(raw_response.body)
    else
      flash.now[:error] = "No such pokemon!"
      render action: "new"
      # render status: 400
      # redirect_to new_pokemon_path, notice: "#{raw_response.status}error!"
    end
  end

  def random_pokemon
    pok=[]
    url='https://pokeapi.co/api/v2/pokemon-species/?limit=0'
    response=Faraday.get(url)
    @row_data=JSON.parse(response.body)
    @row_data.each do |key, value|
      if key=="count"
        @number=value
      end
    end
    @pokemon_number=rand(1...@number)
    raw_response = Faraday.get "https://pokeapi.co/api/v2/pokemon/#{@pokemon_number}"
    @response = JSON.parse(raw_response.body)
  end
  end

