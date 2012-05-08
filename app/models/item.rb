class Item < ActiveRecord::Base
  attr_accessible  :title, :price, :category_id, :attachments_attributes
  
  belongs_to  :category
  belongs_to  :verion
  has_many :attachments, :as => :attachable
  accepts_nested_attributes_for :attachments
  validates :attachments, :presence => true
  validates :title, :presence => true
end
