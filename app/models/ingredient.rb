class Ingredient < ActiveRecord::Base
	has_many :associations, :dependent => :destroy

	scope :non_user, lambda { where("recipe_id is null").order(:ingredient_id) }
end