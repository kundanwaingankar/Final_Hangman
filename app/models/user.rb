class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable, :confirmable, :lockable
  has_one :profile , dependent: :destroy
  accepts_nested_attributes_for :profile
  has_one :game , dependent: :destroy
  accepts_nested_attributes_for :game
  has_many :authentications, :dependent => :delete_all
  after_create :set_default_game

  def apply_omniauth(auth)
    # In previous omniauth, 'user_info' was used in place of 'raw_info'
    self.email = auth['extra']['raw_info']['email']
    #set profile foe user
    build_profile(:first_name => auth['extra']['raw_info']['first_name'], :last_name => auth['extra']['raw_info']['last_name'], :gender => auth['extra']['raw_info']['gender'])
    # Again, saving token is optional. If you haven't created the column in authentications table, this will fail
    authentications.build(:provider => auth['provider'], :uid => auth['uid'], :token => auth['credentials']['token'])
  end

  def set_default_game
    self.create_game(played:0,win:0,lose:0)
  end


end
