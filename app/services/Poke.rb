class Poke
  attr_reader :name, :order, :weight,:image_url, :poke_type, :poke_ability

  def initialize(pokemon)
    # binding.pry

    @name=pokemon[:name]
    @order=pokemon[:id]
    @image_url=pokemon[:sprites][:front_default]
    @weight=pokemon[:weight]
    @poke_type=pokemon[:types][0][:type][:name]
    @poke_ability=pokemon[:abilities][0][:ability][:name]
    # binding.pry
  end
end