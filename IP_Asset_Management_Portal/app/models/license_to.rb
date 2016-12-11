class LicenseTo < ApplicationRecord
	belongs_to :creation, :foreign_key => 'creation_id'
	has_attached_file :licenceagreement, styles: {thumbnail: "60x60#"}
    validates_attachment :licenceagreement, content_type: { content_type: "application/pdf" }
end
