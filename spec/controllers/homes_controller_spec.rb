require 'spec_helper'

describe HomesController do
  describe "GET /index" do
    it "Gives is the expected status code when authenticated." do
      # Sign in as a user.
      #user_signed_in?

      # Invoke the request we're testing.
      get :index

      # Ensure we get the expected response code.
      response.status.should be(200)
    end

    it "Redirects us when not authenticated."
  end

end