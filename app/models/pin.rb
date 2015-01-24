class Pin < ActiveRecord::Base
  belongs_to :board
  belongs_to :author, class_name: "User"
  validates :name, presence: true
end
