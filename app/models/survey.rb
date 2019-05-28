class Survey < ApplicationRecord
  has_many :responses, through: :questions
  has_many :choices, through: :questions
  has_many :questions
  belongs_to :user
  validates :title, presence: true
  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true

end
