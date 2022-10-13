class CreateGratitudeItems < ActiveRecord::Migration[7.0]
  def change
    create_table :gratitude_items do |t|
      t.string :name
      t.text :details
      t.date :date

      t.timestamps
    end
  end
end
