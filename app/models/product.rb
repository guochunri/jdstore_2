class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :wish_lists
  has_many :wish_list_owners, :through => :wish_lists, :source => :user
end
