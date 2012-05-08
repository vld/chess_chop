class Category < ActiveRecord::Base
  include TheSortableTree::Scopes
  acts_as_nested_set
  has_many    :items
  belongs_to  :version
  attr_accessible :name, :parent_id, :version
  
  validates :name, :presence => true
end
