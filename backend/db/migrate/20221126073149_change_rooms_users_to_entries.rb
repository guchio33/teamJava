class ChangeRoomsUsersToEntries < ActiveRecord::Migration[6.1]
  def change
    rename_table :room_users, :entries
  end
end
