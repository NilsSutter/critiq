class Survey < ApplicationRecord
  has_many :responses, through: :questions
  has_many :choices, through: :questions
  has_many :questions
  belongs_to :user
  validates :title, presence: true
end
