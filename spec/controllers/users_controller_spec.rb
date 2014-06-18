require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe "A user" do

    it "requires a name" do
      user = User.new(name: "")

      user.valid?

      expect(user.errors[:name].any?).to be_true
    end

    it "requires an email" do
      user = User.new(email: "")

      user.valid?

      expect(user.errors[:email].any?).to be_true
    end

    it "accepts properly formatted email addresses" do
      emails = %w[user@example.com first.last@example.com]
      emails.each do |email|
        user = User.new(email: email)
        user.valid?
        expect(user.errors[:email].any?).to be_false
      end
    end

    it "rejects improperly formatted email addresses" do
      emails = %w[@ user@ @example.com]
      emails.each do |email|
        user = User.new(email: email)
        user.valid?
        expect(user.errors[:email].any?).to be_true
      end
    end

    it "requires a unique, case insensitive email address" do
      user1 = User.create!(user_attributes)

      user2 = User.new(email: user1.email.upcase)
      user2.valid?
      expect(user2.errors[:email].first).to eq("has already been taken")
    end

    it "is valid with example attributes" do
      user = User.new(user_attributes)

      expect(user.valid?).to be_true
    end

    it "requires a password" do
      user = User.new(password: "")

      user.valid?

      expect(user.errors[:password].any?).to be_true
    end

    it "requires a password confirmation when a password is present" do
      user = User.new(password: "secret", password_confirmation: "")

      user.valid?

      expect(user.errors[:password_confirmation].any?).to be_true
    end

    it "requires the password to match the password confirmation" do
      user = User.new(password: "secret", password_confirmation: "nomatch")

      user.valid?

      expect(user.errors[:password_confirmation].first).to eq("doesn't match Password")
    end

    it "requires a password and matching password confirmation when creating" do
      user = User.create!(user_attributes(password: "secret", password_confirmation: "secret"))

      expect(user.valid?).to be_true
    end

    it "does not require a password when updating" do
      user = User.create!(user_attributes)

      user.password = ""

      expect(user.valid?).to be_true
    end

    it "automatically encrypts the password into the password_digest attribute" do
      user = User.new(password: "secret")

      expect(user.password_digest).to be_present
    end
  end

  describe "list of users" do

    it "displays users" do
      user1 = User.create!(user_attributes(name: "Said", email: "said@example.com"))
      user2 = User.create!(user_attributes(name: "Bobby",   email: "bobby@example.com"))
      user3 = User.create!(user_attributes(name: "Greg", email: "greg@example.com"))
      user4 = User.create!(user_attributes(name: "Kathrina",   email: "kathrina@example.com"))
      user5 = User.create!(user_attributes(name: "Randy", email: "randy@example.com"))


      visit users_url

      expect(page).to have_link(user1.name)
      expect(page).to have_link(user2.name)
      expect(page).to have_link(user3.name)
      expect(page).to have_link(user4.name)
      expect(page).to have_link(user5.name)
    end
  end

  describe "Displaying user's profile page" do

    it "displays user's details" do
      user = User.create!(user_attributes)

      visit user_url(user)

      expect(page).to have_text(user.name)
      expect(page).to have_text(user.email)
    end
  end

  describe "Creating a new user" do
    it "saves the user and shows the user's profile page" do
      visit root_url

      click_link 'Sign Up'

      expect(current_path).to eq(signup_path)

      fill_in "Name",  with: "Example User"
      fill_in "Email", with: "user@example.com"
      fill_in "Password", with: "secret"
      fill_in "Confirm Password", with: "secret"

      click_button 'Create Account'

      expect(current_path).to eq(user_path(User.last))

      expect(page).to have_text('Example User')
      expect(page).to have_text('Thanks for signing up!')
    end

    it "does not save the user if it's invalid" do
      visit signup_url

      expect {
        click_button 'Create Account'
      }.not_to change(User, :count)

      expect(page).to have_text('error')
    end
  end

  describe "Deleting a user" do
    it "destroys the user and redirects to the home page" do
      user = User.create!(user_attributes)

      visit user_path(user)

      click_link 'Delete Account'

      expect(current_path).to eq(root_path)
      expect(page).to have_text('Account successfully deleted!')

      visit users_path

      expect(page).not_to have_text(user.name)
    end
  end
end
