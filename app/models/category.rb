class Category < ActiveRecord::Base
	has_many :soups, dependent: :destroy
	validates :name, presence: true
end
