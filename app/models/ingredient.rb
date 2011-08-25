class Ingredient < ActiveRecord::Base
	has_many :associations, :dependent => :destroy
end