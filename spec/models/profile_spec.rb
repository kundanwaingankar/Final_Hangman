require 'spec_helper'

describe Profile do

  #subject(:user_profile) { Profile.new }

#####################################################
  context "#initialize" do

    before do
      @profile = Profile.new
    end

    it "should respond to first_name" do
      should respond_to(:first_name)
    end

    it "should respond to last_name" do
      should respond_to(:last_name)
    end

    it "should respond to gender" do
      should respond_to(:gender)
    end

    it "should not respond to data" do
      should_not respond_to(:data)
    end
  end

   context "#association" do

     it "should belongs to user" do
       p = Profile.reflect_on_association(:user)
       p.macro.should == :belongs_to
     end

   end

  context "#dataValidation" do

    before do
      @profile = Profile.new
      @profile.first_name = "john k."
      @profile.last_name = "jonson"
      @profile.gender = "male"
    end

    it "Iternia .P as first_name should be valid" do
      @profile.first_name = "Iternia .p"
      @profile.should be_valid
    end

    it "Iternia#123 as first_name should not be valid" do
      @profile.first_name = "Iternia#123"
      @profile.should_not be_valid
    end

    it "blank space as first_name should not be valid" do
      @profile.first_name = "     "
      @profile.should_not be_valid
    end

    it "bar as last_name should be valid" do
      @profile.last_name = "car"
      @profile.should be_valid
    end

    it "bar@ as last_name should not be valid" do
      @profile.last_name = "car@"
      @profile.should_not be_valid
    end

    it "blank space as last_name should not be valid" do
      @profile.last_name = "   "
      @profile.should_not be_valid
    end

    it "male as gender should be valid" do
      @profile.gender = "male"
      @profile.should be_valid
    end

    it "null as gender should not be valid" do
      @profile.gender = "s"
      @profile.should_not be_valid
    end

    it "user_id should exist in user model"  do
      @profile.user_id.should_not == nil
      @profile.user_id.should_not == 0
    end

  end

  context "#uniquness" do

    before do
      @profile = Profile.new
    end

    it "user_id should be unique" do
      should validate_uniqueness_of(:user_id)
    end

  end

end