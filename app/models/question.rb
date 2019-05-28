class Question < ApplicationRecord
  belongs_to :survey

  #has_many :responses, -> { where multiple_choice: true }, through: :choices
  #has_many :responses, -> { where multiple_choice: false }

  has_many :responses, -> { where multiple_choice: false }
  has_many :choices, -> { where multiple_choice: true }
  
  accepts_nested_attributes_for :choices, reject_if: :all_blank, allow_destroy: true
  validates :name, presence: true
  validates :question_type, inclusion: { in: ["text", "radio"] }

end
