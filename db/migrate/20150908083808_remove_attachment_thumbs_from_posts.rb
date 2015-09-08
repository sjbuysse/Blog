class RemoveAttachmentThumbsFromPosts < ActiveRecord::Migration
  def change
    remove_attachment :posts, :thumb
  end
end
