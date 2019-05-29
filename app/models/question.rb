class Question < ApplicationRecord
  # include PG Search to look up models for database entries
  belongs_to :survey
  # include PgSearch
  # pg_search_scope :global_search,
  #   against: [:name],
  #   associated_against: {
  #     survey: [:title, :description]
  #   },
  #   using: {
  #     tsearch: { prefix: true }
  #   }
  has_many :sent_questions
  has_many :responses
  has_many :choices
  accepts_nested_attributes_for :choices, reject_if: :all_blank, allow_destroy: true
  validates :name, presence: true
  validates :question_type, inclusion: { in: ["text", "radio"] }
end
