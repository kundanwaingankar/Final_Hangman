class GamesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def new_game
    @game = HANGMAN::Hangman.new('Support'.downcase)
    session[:game] = @game
    #puts @game.word
    redirect_to game_path
  end

  def new
    #@game = HANGMAN::Hangman.new('Support'.downcase)
    @game = session[:game]

    if @game.counter == @game.word.length
      @result = "You Won"
      @result_word = "Game Word ::- " + @game.word
      current_user.game.played += 1
      current_user.game.win += 1
      game = current_user.game
      game.save
    end

    if @game.missed_counter == 6
      @result = "You lost"
      @result_word = "Game Word ::- " + @game.word
      current_user.game.played += 1
      current_user.game.lose += 1
      game = current_user.game
      game.save
    end
    #puts @game.word
  end

  def user_input
    @game = session[:game]
    @game.game_start(params[:character])
    session[:game] = @game
    redirect_to game_path
  end
end
