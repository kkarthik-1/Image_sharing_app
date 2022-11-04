class Album < ApplicationRecord
  has_many :photos
  belongs_to :user
  validates :name,:Created_date,:Owner,presence: true

end
