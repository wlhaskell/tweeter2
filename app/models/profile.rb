class Profile < ActiveRecord::Base
	belongs_to :user

	has_many :follow, foreign_key: :follower_id
	has_many :following, through: :follow

	mount_uploader :avatar, AvatarUploader
	crop_upladed :avatar


end
