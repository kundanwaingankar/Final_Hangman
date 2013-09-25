require 'spec_helper'

describe SessionsController do

  render_views

  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end
  end

  describe "POST 'create'" do

    describe "failure" do
      it "should re-render the new page"
      it "should have an error message"
    end

    describe "success" do
      it "should sign the user in"
      it "should redirect to the user show page"
    end
  end

  describe "DELETE 'destroy'" do
    it "should sign a user out"
  end

end
