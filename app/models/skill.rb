class Skill < ActiveRecord::Base
	has_many :categorizations, dependent: :destroy
	has_many :users, through: :categorizations
	validates :name, presence: true, uniqueness: true
end
