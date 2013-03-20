class Recipe < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  attr_accessible :Category_id, :description, :ingredients, :name

end
