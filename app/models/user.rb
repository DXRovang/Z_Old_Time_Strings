class User < ApplicationRecord
  include ActiveModel::Validations
  has_secure_password

  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email
  #optional syntax    validates :username, {presence: true, uniqueness: true}
  validates_with EmailValidator
   
  has_many :instruments
  has_many :categories, through: :instruments
  has_many :makers, through: :instruments

end


#validate :custom_method

#def custom_method
  #if self.username.nil? || self.username.empty?
    #self.errors.add(:username, "Must be present")
  #end
#end