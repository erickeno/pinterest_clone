class Board < ActiveRecord::Base
  validates :title, presence: true
  has_many :pins
end
