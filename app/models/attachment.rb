class Attachment < ActiveRecord::Base
  attr_accessible :image
  belongs_to :attachable, :polymorphic => true
  mount_uploader  :image, ImageUploader
end
