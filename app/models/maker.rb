class Maker < ApplicationRecord
  has_many :instruments
  has_many :categories, through: :instruments
  has_many :users, through: :instruments

  def self.search(name)
    self.where("name LIKE ?", name)
  end
end
 