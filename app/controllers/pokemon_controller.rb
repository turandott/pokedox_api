require 'pokemon_request'
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
  end
  def show
    @pokemon = Pokemon.find(params[:id])
  end
  #
  def random_pokemon
    @random_pokemon = Pokemon.find(rand(Pokemon.first.id..Pokemon.last.id))
    # @random_pokemon = Pokemon.find(rand(1..Pokemon.count))
    # @random_pokemon=Pokemon.all.shuffle.last
    # @random_pokemon=Pokemon.find(Pokemon.pluck(:id).sample(1))
    # @random_pokemon=Pokemon.limit(1).order("RANDOM()")
  end





  private
  def pokemon_params
    params.require(:pokemon).permit(:order, :name, :image_url, :weight, :poke_type, :poke_ability)
  end
  end

