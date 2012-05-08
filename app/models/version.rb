class Version < ActiveRecord::Base
  attr_accessible :name
  has_many  :categories
  has_many  :items, :through => :categories
end
