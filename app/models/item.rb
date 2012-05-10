class Item < ActiveRecord::Base
  attr_accessible  :title, :price, :category_id, :attachments, :attachments_attributes
  
  belongs_to  :category
  belongs_to  :verion
  has_many :attachments, :as => :attachable
  accepts_nested_attributes_for :attachments
  validates :title, :presence => true
  validates :category, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
end
