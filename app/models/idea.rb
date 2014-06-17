class Idea < ActiveRecord::Base
  has_many :checkins, dependent: :destroy

  validates :title, :goal, :category, :market, presence: true

  validates :description, length: { minimum: 25 }



end

