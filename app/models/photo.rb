class Photo < ActiveRecord::Base
  validates :user_id, :presence => true
  has_many :comments
  has_many :likes
  belongs_to :user
end
