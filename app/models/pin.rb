class Pin < ActiveRecord::Base
  belongs_to :board
  validates :name, presence: true
end
