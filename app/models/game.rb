class Game < ApplicationRecord
  has_many :questions
  validates :orig_date, presence: true
end
