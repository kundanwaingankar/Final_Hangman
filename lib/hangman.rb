module HANGMAN
  class Hangman

    attr_reader :counter, :word_placeholder, :previous_choice, :missed_counter#, :game_word
    attr_accessor :userInput, :word


    def initialize(word)
      @word = word
      @counter = 0
      @missed_counter = 0
      @previous_choice = []
      @word_placeholder = Array.new(word.length, '_')
    end

    def play

        if @previous_choice.index(@userInput).nil? && !(@userInput.match(/^[[:alpha:]]+$/).nil?)
          @previous_choice.push(@userInput)

          if @userInput.length > 1
            if @word == @userInput
              @counter = @word.length
              #result(@counter, @missed_counter)
            else
              @missed_counter += 1
              @previous_choice.push(@userInput)
            end
          else
            temp = @word.split("")
            found_count = temp.each_index.select{|i| temp[i].casecmp(@userInput) == 0}
            if found_count.length > 0
              @counter += found_count.length
              found_count.each do |index|
                word_placeholder[index]= @userInput
              end
            else
              @missed_counter += 1
            end
          end
        else
          puts "You already entered that before or not a Alphabet"
        end
    end

    def result
        if @counter == @word.length
          puts "You Win"
          puts "Game Word ::- " + @word

        end
        if @missed_counter == 6
          puts "You Loss"
          puts "Game Word ::- " + @word
        end
    end

    def game_start(char_input)

      #while @counter < @word.length && @missed_counter < 6 do
        #print "Game Word :: - "
        #@word_placeholder.each do |u|
        #  print u + " "
        #end
        #puts " "
        #print "wrong choice :: " + @missed_counter.to_s
        #puts " "
        #print "Previous Entered Choice ::-- "
        #@previous_choice.each do |r|
        #  print r + " "
        #end
        #puts " "
        #print "Enter character ::--"
        @userInput = char_input#(gets.chomp).downcase
        play
        result
      #end
    end

  end

  #Hangman.new('Support'.downcase).game_start
end