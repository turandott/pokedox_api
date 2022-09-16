class AddColumnsToPokemons < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemons, :weight, :string
    add_column :pokemons, :poke_type, :string
    add_column :pokemons, :poke_ability, :string
  end
end
