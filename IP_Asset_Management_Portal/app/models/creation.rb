class Creation < ApplicationRecord
	has_many :license_tos
	has_many :owns
	has_many :users, through: :owns
	belongs_to :user, :foreign_key => 'creator_id'
	belongs_to :user, :foreign_key => 'approver'
	#has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    has_attached_file :avatar, styles: {thumbnail: "60x60#"}
    validates_attachment :avatar, content_type: { content_type: "application/pdf" }
end
