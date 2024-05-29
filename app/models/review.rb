class Review < ApplicationRecord
  belongs_to :restaurant # creates a method to READ and ASSIGN
  validates :content, presence: true
end
