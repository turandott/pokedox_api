require 'pokemon_request'
# require 'pry-rails'
class PokemonController < ApplicationController

  # skip_before_action :verify_authenticity_token
  def index
    # pokemons=Pokemon.all.delete_all
    pokemons=PokemonRequest.get_all_pokemons
    pokemons.each do |poke|
      @pokemon=Poke.new(poke)
    @pokemon=Pokemon.create_pokemon(@pokemon)
    end
    @pokemons=Pokemon.order(:id).page(params[:page])
    # pokemon=params[:pokemon]
    # pokemon=PokemonRequest.get_pokemon(pokemon)
    # # binding.pry
    # if !pokemon.nil?
    #   poke=Poke.new(pokemon)
    #   @pokemon=Pokemon.create_pokemon(poke)
    # else
    #   redirect_to root_path
    # end
  end

  def new
     pokemon=params[:pokemon]
      pokemon=PokemonRequest.get_pokemon(pokemon)
      if !pokemon.nil?
        poke=Poke.new(pokemon)
        @pokemon=Pokemon.create_pokemon(poke)
      else
        redirect_to root_path
      end
  #   return if params[:search].blank?
  #   raw_response = Faraday.get "https://pokeapi.co/api/v2/pokemon/#{params[:search]}"
  #   if raw_response.status == 200
  #     @response = JSON.parse(raw_response.body)
  #     @pokemon=Pokemon.new(order: @response["id"], name: @response["name"], image_url: @response["sprites"]["front_default"], weight: @response['weight'],poke_type: @response['types'][0]['type']['name'], poke_ability: @response['abilities'][0]['ability']['name'])
  #   else
  #     flash.now[:error] = "No such pokemon!"
  #     render action: "new"
  #     # render status: 400
  #     # redirect_to new_pokemon_path, notice: "#{raw_response.status}error!"
  #   end
  end
  def show
    @pokemon = Pokemon.find(params[:id])
  end
  #
  def random_pokemon
    @random_pokemon=Pokemon.limit(1).order("RANDOM()")


    #   url='https://pokeapi.co/api/v2/pokemon-species/?limit=0'
  #   response=Faraday.get(url)
  #   @row_data=JSON.parse(response.body)
  #   @row_data.each do |key, value|
  #     if key=="count"
  #       @number=value
  #     end
  #   end
  #   @pokemon_number=rand(1...@number)
  #   raw_response = Faraday.get "https://pokeapi.co/api/v2/pokemon/#{@pokemon_number}"
  #   @response = JSON.parse(raw_response.body)
  # end
  # def create
  #   @pokemon=Pokemon.new(pokemon_params)
  #   if @pokemon.save
  #     redirect_to pokemon_index_path
  #     # render :json
  #   else
  #     render :new
  #   end

  #
  end





  private
  def pokemon_params
    params.require(:pokemon).permit(:order, :name, :image_url, :weight, :poke_type, :poke_ability)
  end
  end

