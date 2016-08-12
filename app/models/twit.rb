class Twit < ActiveRecord::Base
	belongs_to :user
	has_many :tag_twits
	has_many :tags, through: :tag_twits
end
