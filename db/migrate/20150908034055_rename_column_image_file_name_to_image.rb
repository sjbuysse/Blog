class RenameColumnImageFileNameToImage < ActiveRecord::Migration
  def change
      rename_column :picture, :image_file_name, :image
  end
end
