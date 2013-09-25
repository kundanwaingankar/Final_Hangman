require 'spec_helper'

describe PagesController do

  render_views

  describe "GET 'home'" do

    describe "when user not signed in" do
      it "should be successful" do
        get 'home'
        response.should be_success
      end

    end

    describe "when user signed in" do

      it "should have the right game statistics" do
        get :home
      end
    end

  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end

  end

  describe "GET 'help'" do
    it "should be successful" do
      get 'help'
      response.should be_success
    end

  end

end
