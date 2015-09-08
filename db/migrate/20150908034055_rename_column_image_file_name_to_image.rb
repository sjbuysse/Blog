class RenameColumnImageFileNameToImage < ActiveRecord::Migration
  def change
      rename_column :pictures, :image_file_name, :image
  end
end
