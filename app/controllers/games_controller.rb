class GamesController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def new_game

    #######
    #	options.reverse_merge!(
    #		:min_length => 4
    #         )
    #	get random word from wordnik
    #	str = Wordnik.words.get_random_word(:nim_length => 4)
    #	puts str["word"]

    #########
    flag = true
    game_word = ""
    # Word Length should be greater 3
    begin
      lineNo = rand(1067)
      file_path = Rails.root + "public/wordsEn.txt"
      fileData = IO.readlines(file_path)
      game_word = fileData[lineNo].chomp
      if(game_word.length >= 3)
        # return from loop if word length is 3 or more
        flag = false
      end
    end while flag
    @game = HANGMAN::Hangman.new(game_word.downcase)
    session[:game] = @game

    # Get word definition
    #

    current_user.game.played += 1
    current_user.game.save
    session[:game_flag] = true
    redirect_to game_path
  end

  def new
    @game = session[:game]
    if session[:game_flag]
      if @game.counter == @game.word.length
        @result = "You Won"
        @result_word = @game.word
        session[:result] = @result
        session[:result_word] = @result_word
        current_user.game.win += 1
        game = current_user.game
        game.save
        session[:game_flag] = false

        # get word meaning
#        @word_def = Wordnik.word.get_definitions(@game.word, :limit => 3)
        #puts word_def

      end
      if @game.missed_counter == 6
        @result = "SORRY, YOU ARE HANGED!!!"
        @result_word = @game.word
        session[:result] = @result
        session[:result_word] = @result_word
        current_user.game.lose += 1
        game = current_user.game
        game.save
        session[:game_flag] = false

        #get Word Meaning
 #       @word_def = Wordnik.word.get_definitions(@game.word, :limit => 3)
        #puts word_def

      end
    else
      @result = session[:result]
      @result_word = session[:result_word]
#      @word_def = Wordnik.word.get_definitions(@game.word, :limit => 3)
      #puts word_def
    end
  end

  def user_input
    @game = session[:game]
    @game.game_start(params[:character])
    session[:game] = @game
    redirect_to game_path
  end
end
