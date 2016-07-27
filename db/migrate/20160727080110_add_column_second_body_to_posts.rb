class AddColumnSecondBodyToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :second_body, :string
  end
end
