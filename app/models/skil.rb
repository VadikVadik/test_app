class Skil < ApplicationRecord
  has_many :skils_users
  has_many :users, through: :skils_users

  validates :name, presence: true
end
