require 'spec_helper'

describe Game do

  #subject(:game) { Game.new }

  context "#initialize" do

    it "should have a win data" do
      should respond_to(:win)
    end

    it "should have a played data" do
      should respond_to(:played)
    end

    it "should have a lose data" do
      should respond_to(:lose)
    end

  end


  context ".playing_first_time"  do                      #user is playing game for first time

    before do
      @game = Game.new
      @game.played = 0
      @game.win = 0
      @game.lose = 0
    end

    it "should have no_of_times_game Played equal to 0" do
      @game.played = 0
      @game.should be_valid
    end

    it "should have no_of_times_game win equal to 0" do
      @game.win = 0
      @game.should be_valid
    end

    it "should have no_of_times_game lose equal to 0" do
      @game.lose = 0
      @game.should be_valid
    end

    it "should not have no_of_times_game Played counter greater than 0" do
      @game.played.should_not eql(2)
    end

    it "should not have no_of_times_game win counter greater than 0" do
      @game.win.should_not eql(4)
    end

    it "should not have no_of_times_game lose counter greater than 0" do
      @game.lose.should_not eql(3)
    end


    before do
      @game = Game.new
    end

    it "no_of_times_game Played counter should exist in user model" do
      @game.played.should == nil
      @game.should_not be_valid
    end

    it "no_of_times_game win counter should exist in user model" do
      @game.win.should == nil
      @game.should_not be_valid
    end

    it "no_of_times_game lose counter should exist in user model" do
      @game.lose.should == nil
      @game.should_not be_valid
    end

  end

  context ".already_played_games"  do                     #user already played games

    before do
      @game = Game.new
      @game.played = 8
      @game.win = 5
      @game.lose = 3
    end

    it "total played game should be equal to (win + loss)" do
      @game.played.should eq(@game.win + @game.lose)
    end

    it "total played game should not be different than (win + loss)" do
      @game.played.should_not eql(10)
    end

    it "lose game should be equal to (total played game - win)" do
      @game.lose.should eq(@game.played - @game.win)
    end

    it "lose game should not be different than (total played game - win)" do
      @game.lose.should_not eql(0)
    end

    it "win game should be equal to (total played game - lose)" do
      @game.win.should eq(@game.played - @game.lose)
    end

    it "win game should not be different than (total played game - lose)" do
      @game.win.should_not eql(7)
    end

  end


  context "#associations" do
    it "should belongs to User" do
      p = Game.reflect_on_association(:user)
      p.macro.should == :belongs_to
    end
    # or
    ###
    #it { should belongs_to(:user) }
    ###
  end

end