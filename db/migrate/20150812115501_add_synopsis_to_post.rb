class AddSynopsisToPost < ActiveRecord::Migration
  def change
    add_column :posts, :synopsis, :text
  end
end
