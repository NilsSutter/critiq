class Survey < ApplicationRecord
  has_many :responses, through: :questions
  has_many :questions, dependent: :destroy
  has_many :choices, through: :questions
  belongs_to :user
  validates :title, presence: true
  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true
end
