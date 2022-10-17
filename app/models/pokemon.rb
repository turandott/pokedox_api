class Pokemon<ApplicationRecord
  validates_presence_of :name, :order, :weight, :image_url, :poke_type, :poke_ability
  validates_uniqueness_of :name, :order
  def self.create_pokemon(data)
    create(
      name: data.name,
      order: data.order,
      image_url: data.image_url,
      weight: data.weight,
      poke_type: data.poke_type,
      poke_ability: data.poke_ability
    )
    # Pokemon.save
  end
end
