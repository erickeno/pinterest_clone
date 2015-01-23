class Board < ActiveRecord::Base
  validates :title, presence: true
  has_many :pins, dependent: :delete_all
end
