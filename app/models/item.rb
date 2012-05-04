class Item < ActiveRecord::Base
  attr_accessible  :title, :price, :category, :attachments_attributes
  
  belongs_to :category
  
  has_many :attachments, :as => :attachable
  accepts_nested_attributes_for :attachments
  validates :attachments, :presence => true
  validates :title, :presence => true
end
