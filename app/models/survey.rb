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
  has_many :questions, dependent: :destroy
  has_many :choices, through: :questions
  belongs_to :user
  # validations
  validates :title, presence: true
  # validates :channel_id, presence: true ( GetSlackChannelsJob.perform_now)
  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true
  after_update :send_first_question

  def display_responses
    survey = Survey.find(self.id)
    unless survey.questions.empty?
      if survey.questions.last.responses.count > ((survey.questions.first.sent_question_ids.count - 1) * 0.7).floor
        return survey.questions
      else
        stripped_questions = []
        survey.questions.each { |x| stripped_questions << {name: x.name, question_type: x.question_type, responses: [], choices: x.choices} }
        return stripped_questions
      end
    end
  end

  private

  def send_first_question
    # Get FIRST question ID
    puts ""
    puts "* Inside Survey Model *"
    first_question_id = Survey.find(self.id).questions.first.id
    puts "> Survey_ID: #{first_question_id}"
    puts "> Self ID  : #{self.id}"

    # send FIRST associated question to SendSlackMessageJob with Survey_ID
    SendSlackMessageAllJob.perform_later(survey_id: self.id, question_id: first_question_id.to_i)
  end
end
