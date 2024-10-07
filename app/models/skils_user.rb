class SkilsUser < ApplicationRecord
  belongs_to :user
  belongs_to :skil
end
