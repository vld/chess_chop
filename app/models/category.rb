class Category < ActiveRecord::Base
  include TheSortableTree::Scopes
  acts_as_nested_set
  has_many  :items
  attr_accessible :name, :parent_id
  
  validates :name, :presence => true
end
