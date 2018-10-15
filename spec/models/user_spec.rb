require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it "should not create new user successfully with no pw confirmation" do
      user = User.new
      user.name = "Alfred Law"
      user.email = "alfred@lighthouse.com"
      user.password = "abc123"
      user.password_confirmation = nil
      expect(user).not_to be_valid
    end

    it "should not create new user successfully with no pw " do
      user = User.new
      user.name = "Alfred Law"
      user.email = "alfred@lighthouse.com"
      user.password = nil
      user.password_confirmation = "abc123"
      expect(user).not_to be_valid
    end

    it "should not create new user successfully with different pw confirmation" do
      user = User.new
      user.name = "Alfred Law"
      user.email = "alfred@lighthouse.com"
      user.password = "cba123"
      user.password_confirmation = "abc123"
      expect(user).not_to be_valid
    end

    it "should not create new user successfully with 3 letter password" do
      user = User.new
      user.name = "Alfred Law"
      user.email = "alfred@lighthouse.com"
      user.password = "abc"
      user.password_confirmation = "abc"
      expect(user).not_to be_valid
    end

    it "should not create new user successfully without name" do
      user = User.new
      user.name = nil
      user.email = "alfred@lighthouse.com"
      user.password = "abc123"
      user.password_confirmation = "abc123"
      expect(user).not_to be_valid
    end

    it "should not create new user successfully if email not unique" do
      user = User.new
      user.name = "Alfred Law"
      user.email = "alfred@lighthouse.com"
      user.password = "abc123"
      user.password_confirmation = "abc123"

      user2 = User.new
      user.name = "Alfred Law"
      user.email = "alfred@lighthouse.com"
      user.password = "abc123"
      user.password_confirmation = "abc123"
      expect(user2).not_to be_valid
    end

  end

  describe '.authenticate_with_credentials' do

    it "should successfully log in" do
      user = User.new
      user.name = "Alfred Law"
      user.email = "alfred@lighthouse.com"
      user.password = "abc123"
      user.password_confirmation = "abc123"
      user.save

      user2 = User.authenticate_with_credentials("alfred@lighthouse.com", "abc123")

      expect(user.id).to be(user2.id)
    end

    it "should successfully log in with varying capital letters" do
      user = User.new
      user.name = "Alfred Law"
      user.email = "alfRED@lighthouse.com"
      user.password = "abc123"
      user.password_confirmation = "abc123"
      user.save

      user2 = User.authenticate_with_credentials("ALFRED@lightHOUSE.com", "abc123")
      user2.save
      expect(user.id).to be(user2.id)
    end

    it "should successfully log in with spaces in front and back of email" do
      user = User.new
      user.name = "Alfred Law"
      user.email = "alfred@lighthouse.com"
      user.password = "abc123"
      user.password_confirmation = "abc123"
      user.save

      user2 = User.authenticate_with_credentials("     alfred@lighthouse.com   ", "abc123")
      user2.save
      expect(user.id).to be(user2.id)
    end

  end

end
