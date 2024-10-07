class User < ApplicationRecord
  has_many :interests_users
  has_many :interests, through: :interests_users

  has_many :skils_users
  has_many :skills, through: :skils_users, source: :skil

  validates :name, :surname, :age, :email, :nationality,
            :country, :gender, presence: true
  validates :email, uniqueness: true
  validates :age, comparison: { greater_than_or_equal_to: 0 }
  validates :age, comparison: { less_than: 90 }
  validates :gender, format: { with: /\A(?:fe)?male\z/i }
end
