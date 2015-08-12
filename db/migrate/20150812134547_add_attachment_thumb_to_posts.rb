class AddAttachmentThumbToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :thumb
    end
  end

  def self.down
    remove_attachment :posts, :thumb
  end
end
