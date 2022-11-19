class ChangeForeignKeyToPosts < ActiveRecord::Migration[6.1]
  def change
    change_column_null :Post, :user_id, false
  end
end
