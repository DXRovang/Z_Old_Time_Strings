class Category < ApplicationRecord
  belongs_to :family
  has_many :instruments
  has_many :users, through: :instruments
  has_many :makers, through: :instruments
end
 