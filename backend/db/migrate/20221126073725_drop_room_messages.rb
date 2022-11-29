class DropRoomMessages < ActiveRecord::Migration[6.1]
  def change
    drop_table :room_messages
  end
end
