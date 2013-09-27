require 'spec_helper'

#describe "PagesController" do
#
#  render_views
#
#  describe "GET 'homes'" do
#
#    describe "when user not signed in" do
#      it "should be successful" do
#        get :index
#        response.should be_success
#      end
#
#    end
#
#    describe "when user signed in" do
#
#      it "should have the right game statistics" do
#        get :index
#      end
#    end
#
#  end
#
#  describe "GET 'about'" do
#    it "should be successful" do
#      get 'about'
#      response.should be_success
#    end
#
#  end
#
#  describe "GET 'help'" do
#    it "should be successful" do
#      get 'help'
#      response.should be_success
#    end
#
#  end
#
#end

#describe "PagesController" do
#  describe HomesController do
#  render_views
#  describe "GET index" do
#    it "assigns @pages" do
#      home = Home.create
#      get :index
#      expect(assigns(:homes)).to eq([home])
#    end
#
#    it "renders the index template" do
#      get :index
#      expect(response).to render_template("index")
#    end
#  end
#    end
#end

# Request specs for the invoices controller.
describe HomesController do
  describe "GET /index" do
    it "Gives is the expected status code when authenticated." do
      # Sign in as a user.
      user_signed_in?

      # Invoke the request we're testing.
      get :index

      # Ensure we get the expected response code.
      response.status.should be(200)
    end

    it "Redirects us when not authenticated." do
      # Invoke the request we're testing.
      get invoices_path

      # Ensure we get the expected response code.
      response.status.should be(302)
    end
  end
end