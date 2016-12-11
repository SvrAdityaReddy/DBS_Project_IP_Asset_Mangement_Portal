class AddAttachmentLicenceagreementToUsers < ActiveRecord::Migration
  def self.up
    change_table :license_tos do |t|
      t.attachment :licenceagreement
    end
  end

  def self.down
    remove_attachment :license_tos, :licenceagreement
  end
end
