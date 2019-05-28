class Question < ApplicationRecord
  belongs_to :survey
  # has_many :responses, through: :choices, -> { where multiple_choice: true }
  has_many :responses

  has_many :choices
  accepts_nested_attributes_for :choices, reject_if: :all_blank, allow_destroy: true
  validates :name, presence: true
  validates :question_type, inclusion: { in: ["text", "radio"] }
end
