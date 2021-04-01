class Maker < ApplicationRecord
  has_many :instruments
  has_many :categories, through: :instruments
  has_many :users, through: :instruments

  scope :search, ->(name) { where("name LIKE ?", name) }
end
 