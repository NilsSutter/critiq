class CreateSlackbotdevs < ActiveRecord::Migration[5.2]
  def change
    create_table :slackbotdevs do |t|
      t.string :slack_channel
      t.string :slack_user
      t.string :content

      t.timestamps
    end
  end
end
