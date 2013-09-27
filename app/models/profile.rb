class Profile < ActiveRecord::Base
  validates :first_name, :last_name, presence: true, format: {with: /\A[a-zA-Z\s .]+\z/, message: "No special characters allowed except space & dot"}
  validates :gender, presence: true
  belongs_to :user
end
