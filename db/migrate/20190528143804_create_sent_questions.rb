class CreateSentQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :sent_questions do |t|
      t.references :question, foreign_key: true
      t.string :recipent_slack_uid

      t.timestamps
    end
  end
end
