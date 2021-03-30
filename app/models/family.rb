class Family < ApplicationRecord
  has_many :categories
  has_many :instruments, through: :categories
end
