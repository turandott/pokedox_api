require 'pokemon_request'
require 'pry-rails'
class PokemonController < ApplicationController
  # skip_before_action :verify_authenticity_token
  def index
    # binding.pry
    # pokemon=params[:pokemon]
    @pokemon=PokemonRequest.get_pokemon
    # binding.pry
    @poke=Poke.new(@pokemon)

    # pokemon_ex = params[:pokemon]
    @pokemon_ex=Pokemon.create_pokemon(@poke)


    # pokemons=[]
    # url='https://pokeapi.co/api/v2/pokemon?limit=20'
    # response=Faraday.get(url)
    #  @row_data=JSON.parse(response.body)
    # @row_data.each do |key, value|
    #   if key=="results"
    #     value.each do |k, v|
    #       response=Faraday.get(k["url"])
    #       @response=JSON.parse(response.body)
    #       pokemons<<@response
    #     end
    #   end
    # end
    # @pokemons=pokemons

    end

  # def new
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
  # end
  #
  # def random_pokemon
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
    # @pokemons.map do |poke|
    #   Pokemon.new(pokemon_params)
        # (img:poke['sprites']['other']['dream_world']["front_default"],
        # name: poke['forms'][0]['name'], weight: poke['weight'],
        # poke_type: poke['types'][0]['type']['name'],
        # poke_ability: poke['abilities'][0]['ability']['name'],
        # poke_id: poke['id'])
    # end
  #
  # end

  # def show
  #   @pokemon = Pokemon.find(params[:id])
  # end

  private
  def pokemon_params
    params.require(:pokemon).permit(:order, :name, :image_url, :weight, :poke_type, :poke_ability)
  end
  end

