class Item < ApplicationRecord
 mount_uploader :image, ImageUploader

belongs_to :user
belongs_to :category

has_many :bids
has_many :users, through: :bids


end
