class AddCommentToBlacklists < ActiveRecord::Migration[6.0]
  def change
    add_column :blacklists, :comment, :text
  end
end
