class PokemonSerializer
  include JSONAPI::Serializer
  attributes :name, :order, :image_url, :weight, :poke_type, :poke_ability
end
