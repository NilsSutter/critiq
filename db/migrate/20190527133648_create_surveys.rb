class CreateSurveys < ActiveRecord::Migration[5.2]
  def change
    create_table :surveys do |t|
      t.string :title
      t.string :description
      t.string :channel_id
      t.boolean :published, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
