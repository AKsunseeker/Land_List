class AddAttachmentAvatarToRealtors < ActiveRecord::Migration
  def self.up
    change_table :realtors do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :realtors, :avatar
  end
end
