class AddUserIdToGratitudeItems < ActiveRecord::Migration[7.0]
  def change
    add_column :gratitude_items, :user_id, :integer
  end
end
