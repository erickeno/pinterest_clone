class Board < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  validates :title, presence: true
  has_many :pins, dependent: :delete_all
  
end
