require 'spec_helper'

describe User do
  before do
    @user = User.new(email: "shweta@iternia.com", password: "password1234")
  end

  subject{@user}
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should be_valid }
  it { should validate_uniqueness_of(:email) }

  context "email should not be blank" do
    before { @user.email = " "}
    it { should_not be_valid }
  end

  context "email length should not be greater than 25" do
    before { @user.email = "sgsgsgsgsgsgsshddhdhhdhhdhdhhdhhdhhdhhdhdhddhddhdhdhdhdhd "}
    it { should_not be_valid }
  end

  context "password should not be blank" do
    before { @user.password = " "}
    it { should_not be_valid }
  end

  #describe 'when password is too short' do
  #  it { should ensure_length_of(:password).is_at_least(8) }
  #  it { should_not be_valid }
  #end

  context "password length should be greater than or equal to six" do
    before { @user.password = "pass"}
    it { should_not be_valid }
  end

  context "password length should not be greater than 25" do
    before { @user.password = "pass4242bbsbsbsbs35434bvzbzbzbzbzbzbzbzbzbzbzb"}
    it { should_not be_valid }
  end

  context "password should contain atleast one number" do
    before { @user.password = "pass2222"}
    it { should be_valid }
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

describe "#send_password_reset" do
  let(:user) { Factory(:user) }

  it "generates a unique password_reset_token each time" do
    user.send_password_reset
    last_token = user.password_reset_token
    user.send_password_reset
    user.password_reset_token.should_not eq(last_token)
  end

  it "saves the time the password reset was sent" do
    user.send_password_reset
    user.reload.password_reset_sent_at.should be_present
  end

  it "delivers email to user" do
    user.send_password_reset
    last_email.to.should include(user.email)
  end
end
