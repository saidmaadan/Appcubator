require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  describe 'authenticate user' do

    it "signs in the user if the email/password combination is valid" do


      expect(page).to have_link(user.name)
      expect(page).not_to have_link('Sign In')
      expect(page).not_to have_link('Sign Up')
    end

    it "does not sign in the user if the email/password combination is invalid" do


      expect(page).not_to have_link(user.name)
      expect(page).to have_link('Sign In')
      expect(page).to have_link('Sign Up')
    end
  end

  describe "Signing out" do

    it "removes the user id from the session" do
      user = User.create!(user_attributes)

      sign_in(user)

      click_link 'Sign Out'

      expect(page).to have_text("signed out")
      expect(page).not_to have_link('Sign Out')
      expect(page).to have_link('Sign In')
    end
  end

end
