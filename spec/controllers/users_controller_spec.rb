require 'spec_helper'

describe UsersController do
  describe "GET 'show'" do

    it "should be successful"

    it "should find the right user"

    it "should have the user's name"

    it "should have a profile"

    it "should have the right URL"

  end

  describe "GET 'new'" do

    it "should be successful"

  end

  describe "POST 'create'" do

    describe "failure" do
      it "should render the 'new' page"
      it "should not create a user"
    end

    describe "success" do
      it "should create a user"
      it "should have a welcome message"
    end
  end

  describe "GET 'edit'" do
    it "should be successful"
  end

  describe "PUT 'update'" do

    describe "failure" do
      it "should render the 'edit' page"
    end

    describe "success" do
      it "should change the user's attributes"
      it "should have a flash message"
    end
  end

  describe "authentication of edit/update actions" do

    describe "for non-signed-in users" do
      it "should deny access to 'edit'"
      it "should deny access to 'update'"
    end

    describe "for signed-in users" do
      it "should require matching users for 'edit'"
      it "should require matching users for 'update'"
    end
  end
end
