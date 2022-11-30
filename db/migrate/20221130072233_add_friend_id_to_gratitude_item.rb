class AddFriendIdToGratitudeItem < ActiveRecord::Migration[7.0]
  def change
    add_column :gratitude_items, :friend_id, :integer
  end
end
