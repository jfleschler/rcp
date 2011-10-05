# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
ingredients = [
	{:name => "salted butter",		:image => "ingredients/butter.png",		:tag_name => ""},
	{:name => "unsalted butter",	:image => "ingredients/butter.png",		:tag_name => ""},
	{:name => "white sugar",		:image => "placeholder.png",			:tag_name => ""},
	{:name => "dark brown sugar",	:image => "placeholder.png",			:tag_name => ""},
	{:name => "light brown sugar",	:image => "placeholder.png",			:tag_name => ""},
	{:name => "egg",				:image => "ingredients/egg.png",		:tag_name => ""},
	{:name => "egg white",			:image => "placeholder.png",			:tag_name => ""},
	{:name => "vanilla extract",	:image => "placeholder.png",			:tag_name => ""},
	{:name => "all-purpose flour",	:image => "ingredients/flour.png",			:tag_name => ""},
	{:name => "salt",				:image => "placeholder.png",			:tag_name => ""},
	{:name => "baking powder",		:image => "placeholder.png",			:tag_name => ""},
	{:name => "baking soda",		:image => "placeholder.png",			:tag_name => ""},
	{:name => "chocolate chips",	:image => "placeholder.png",			:tag_name => "chocolate"},
	{:name => "cinnamon",			:image => "placeholder.png",			:tag_name => "cinnamon"},
	{:name => "milk",				:image => "placeholder.png",			:tag_name => ""},
	{:name => "raisins",			:image => "placeholder.png",			:tag_name => "raisins"},
	{:name => "cake flour",			:image => "ingredients/flour.png",			:tag_name => ""},
	{:name => "strawberries",		:image => "placeholder.png",			:tag_name => ""}
].each do |i|
	ingredient = Ingredient.find_or_create_by_name(i)
	ingredient.update_attributes(i)
	ingredient.save
end

keywords = [
	{:word => "cookie"},
	{:word => "pie"},
	{:word => "muffin"},
	{:word => "cake"},
	{:word => "bread"},
	{:word => "pretzel"},
	{:word => "chicken"},
	{:word => "beef"},
	{:word => "fish"},
	{:word => "soup"},
	{:word => "stuffing"},
	{:word => "cupcake"}
].each do |k|
	keyword = Keyword.find_or_create_by_word(k)
	keyword.update_attributes(k)
	keyword.save
end

Recipe.all.each do |r|
	r.build_tag_list
	r.save
end