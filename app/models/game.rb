class Game < ActiveRecord::Base
  belongs_to :user
  validates :played, :win, :lose, numericality: {only_integer: true}
  before_create :set_default_values

  private
  def set_default_values

    self.played=0
    self.win=0
    self.lose=0
  end
end
