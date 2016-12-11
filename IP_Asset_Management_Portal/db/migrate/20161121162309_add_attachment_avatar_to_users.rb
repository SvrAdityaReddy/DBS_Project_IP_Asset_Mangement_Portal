class AddAttachmentAvatarToUsers < ActiveRecord::Migration
  def self.up
    change_table :creations do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :creations, :avatar
  end
end
