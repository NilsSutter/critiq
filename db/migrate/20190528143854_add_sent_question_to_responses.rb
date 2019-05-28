class AddSentQuestionToResponses < ActiveRecord::Migration[5.2]
  def change
    add_reference :responses, :sent_question, foreign_key: true
  end
end
