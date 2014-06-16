class Project < ActiveRecord::Base

  def self.recent
    order("created_at desc")
  end
end
