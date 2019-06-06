class Question < ApplicationRecord
  belongs_to :survey
  has_many :choices, dependent: :destroy
  has_many :sent_questions, dependent: :destroy
  has_many :responses, dependent: :destroy

  accepts_nested_attributes_for :choices, reject_if: :all_blank, allow_destroy: true
  validates :name, presence: true
  validates :question_type, inclusion: { in: ["text", "radio"] }

  def array_of_choice_percentages
    this = Question.find(self.id)
    output = []
    if this.question_type == "radio"
      this.choices.each_with_index do |choice, c_index|
        output << this.responses.select { |x| x.content.to_i == (c_index + 1) }.count
      end
    end
    return output
  end
end
