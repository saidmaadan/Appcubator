class Contact < ActiveRecord::Base
	validates :name, :email, :comments, presence: true
end