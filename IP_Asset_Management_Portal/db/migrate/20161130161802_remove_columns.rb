class RemoveColumns < ActiveRecord::Migration[5.0]
  def self.up
    remove_column :license_tos, :license_agreement
  end
end
