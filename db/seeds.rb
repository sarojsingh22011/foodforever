# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.comment([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.comment(name: 'Emanuel', city: cities.first)

require 'rubygems'
require 'open-uri'
require 'nokogiri'

base_url="http://www.indianfoodforever.com/"
cat_doc=Nokogiri::HTML(open(base_url))

#Category....
i=1 # To store the category id
cat_doc.css('div.top-link a').each do |category|
  category_name=category.content
  puts category_name
  category_url=category['href']
  #puts category_url
  Category.create(:name => category_name)

#Recipes....
  category_page=Nokogiri::HTML(open(category_url))
  category_page.css('div.mainlinks a').each do |recipe|

    recipe_name=recipe.content
    recipe_url=recipe['href'].to_s
    unless recipe_url == "http://www.indianfoodforever.com/muhroom/"
      puts recipe_name
      #puts recipe_url


      #Getting the ingredients and description...
      recipe_page=Nokogiri::HTML(open(recipe_url))

      ingredients=recipe_page.css('div.text').inner_html
      description=recipe_page.css('ul').inner_html
      puts ingredients
      puts description
      Recipe.create(:Category_id => i, :name => recipe_name, :ingredients => ingredients, :description => description)

    end # end of recipe loop
  end # end rescue loop
  if (i==9)
    break
  end
  i=i+1
end #end of category loop
