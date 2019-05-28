class Question < ApplicationRecord
  belongs_to :survey
  has_many :responses, -> { where multiple_choice: true }, through: :choices
  #has_many :responses, -> { where multiple_choice: false }
end
