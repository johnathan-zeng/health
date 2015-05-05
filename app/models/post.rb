class Post < ActiveRecord::Base
  belongs_to :user
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :title, presence: true
  validates :body, length: {minimum: 5}
  validates :body, length: {maximum: 150}, presence: true
  presence = /[0-9]+/
end
