class Question < ApplicationRecord
  belongs_to :survey
  has_many :responses, through: :choices, -> { where multiple_choice: true }
  has_many :responses, -> { where multiple_choice: false }
end
