class Game < ActiveRecord::Base
  belongs_to :user

 # before_create :set_default_values
  validates :played, :win, :lose, numericality: {only_integer: true}

  private
  def set_default_values
    puts "inside set default values--------->"
    self.played=0
    self.win=0
    self.lose=0
  end
end
