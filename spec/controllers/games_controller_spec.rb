require 'spec_helper'

describe GamesController do
   describe "GET /new_game" do
     before(:each) do
       @game = HANGMAN::Hangman.new("support".downcase)
     end
     it "Should display game view" do
       get :new_game

       response.should redirect_to(:action => "new")
     end
   end
end
