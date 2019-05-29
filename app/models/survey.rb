class Survey < ApplicationRecord
  # Pg Search
  include PgSearch
  pg_search_scope :search_by_title_and_description,
    against: [:title, :description],
    associated_against: {
      question: [:name]
    },
    using: {
      tsearch: { prefix: true } # <-- wordpieces return something
    }
  # associations
  has_many :responses, through: :questions
  has_many :choices, through: :questions
  has_many :questions
  belongs_to :user
  # validations
  validates :title, presence: true
  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true
end
