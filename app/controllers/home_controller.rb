class HomeController < ApplicationController
  before_action :authenticate_user!, only: :token

  def token
  end
  def index
    if user_signed_in?
      @game=current_user.game
      puts @game.played
      puts @game.lose
      puts @game.win

    end
  end
  def help

  end
end
