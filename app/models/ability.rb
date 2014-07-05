class Ability < ActiveRecord::Base
	has_many :associations, dependent: :destroy
	has_many :users, through: :associations
	validates :strenght, presence: true, uniqueness: true
end
