# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
ingredients = [
	{:name => "butter",				:image => "placeholder.png"},
	{:name => "white sugar",		:image => "placeholder.png"},
	{:name => "brown sugar",		:image => "placeholder.png"},
	{:name => "egg",				:image => "placeholder.png"},
	{:name => "vanilla extract",	:image => "placeholder.png"},
	{:name => "flour",				:image => "placeholder.png"},
	{:name => "salt",				:image => "placeholder.png"},
	{:name => "baking powder",		:image => "placeholder.png"},
	{:name => "baking soda",		:image => "placeholder.png"},
	{:name => "chocolate chips",	:image => "placeholder.png"},
	{:name => "cinnamon",			:image => "placeholder.png"},
	{:name => "milk",				:image => "placeholder.png"},
	{:name => "raisins",			:image => "placeholder.png"}
].each do |i|
	Ingredient.find_or_create_by_name(i)
end