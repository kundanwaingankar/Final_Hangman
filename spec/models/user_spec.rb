require 'spec_helper'

describe User do

  before(:each) do
    @attr = {
        :email => "user@example.com",
        :password => "changeme",
        :password_confirmation => "changeme"
    }
  end

  it "should create a new instance given a valid attribute" do
    User.create!(@attr)
  end

  it "email should not be blank" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end

  it "should accept valid email addresses" do
    addresses = %w[shweta@yahoo.com]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[shweta.yahoo@com]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end

  it "should reject duplicate email addresses" do
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  it "should reject email addresses identical up to case" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  describe "passwords" do

    before(:each) do
      @user = User.new(@attr)
    end

    it "should have a password attribute" do
      @user.should respond_to(:password)
    end

    it "should have a password confirmation attribute" do
      @user.should respond_to(:password_confirmation)
    end
  end

  describe "password validations" do

    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).
          should_not be_valid
    end

    it "should require a matching password confirmation" do
      User.new(@attr.merge(:password_confirmation => "invalid")).
          should_not be_valid
    end

    it "should reject short passwords" do
      psw = @attr.merge(:password => "abcd", :password_confirmation => "abcd")
      User.new(psw).should_not be_valid
    end

    it "should reject long passwords" do
      longPsw = "a" * 35
      psw = @attr.merge(:password => longPsw, :password_confirmation => longPsw)
      User.new(psw).should_not be_valid
    end

  end

  describe "password encryption" do

    before do
      @user = User.new(email: "shweta@iternia.com", password: "password1234", :password_confirmation => "password1234")
    end

    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end

    it "should set the encrypted password attribute" do
      @user.encrypted_password.should_not be_blank
    end

  end

  context "#associations" do

    it "should has one profile entry" do
      p = User.reflect_on_association(:profile)
      p.macro.should == :has_one
    end

    it "should has one game entry" do
      p = User.reflect_on_association(:game)
      p.macro.should == :has_one
    end

  end
end
