class AddAttachmentImageToChannels < ActiveRecord::Migration
  def self.up
    change_table :channels do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :channels, :image
  end
end
