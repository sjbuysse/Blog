class RenameColumnBodyToFirstBody < ActiveRecord::Migration
  def change
      rename_column :posts, :body, :first_body
  end
end
