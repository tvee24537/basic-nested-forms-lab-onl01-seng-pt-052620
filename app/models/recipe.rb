
class Recipe < ActiveRecord::Base
  has_many :ingredients
  accepts_nested_attributes_for :ingredients

  def ingredients_attributes=(ingredients)
    ingredients.each do |ingr|
      self.ingredients << Ingredient.find_or_create_by(ingr[1])
      self.save
    end
  end
end