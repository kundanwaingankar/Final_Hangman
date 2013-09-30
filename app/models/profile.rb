class Profile < ActiveRecord::Base
  validates :first_name, :last_name, presence: true, format: {with: /\A[a-zA-Z\s .]+\z/, message: "No special characters allowed except space & dot"}
  validates :gender, presence: true
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/:style/missing.png"
  #validates :avatar, :attachment_presence => true
=begin
  validates_attachment :avatar, :presence => true,
                       :content_type => { :content_type => "image/jpg" },
                       :size => { :in => 0..10.kilobytes }
=end
  belongs_to :user
end
