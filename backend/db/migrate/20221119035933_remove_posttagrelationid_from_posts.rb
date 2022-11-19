class RemovePosttagrelationidFromPosts < ActiveRecord::Migration[6.1]
  def change
    change_column_null :posts, :post_tag_relation_id, true
  end
end
