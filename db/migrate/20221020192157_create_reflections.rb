class CreateReflections < ActiveRecord::Migration[7.0]
  def change
    create_table :reflections do |t|
      t.string :title
      t.text :body
      t.date :reflection_date
      t.integer :gratitude_item_id

      t.timestamps
    end
  end
end
