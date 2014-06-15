require 'rails_helper'

RSpec.describe ProjectsController, :type => :controller do

  describe "Viewing the list of projects" do

    it "shows the projects" do
      visit 'http://example.com/projects'

      expect(page).to have_text("4 Projects")
    end
 end
end

