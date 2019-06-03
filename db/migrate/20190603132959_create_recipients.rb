class CreateRecipients < ActiveRecord::Migration[5.2]
  def change
    create_table :recipients do |t|
      t.string :uid
      t.string :first_name
      t.string :last_name
      t.references :survey, foreign_key: true

      t.timestamps
    end
  end
end
