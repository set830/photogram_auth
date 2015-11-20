class Photo < ActiveRecord::Base
  validates :user, :presence => true
  has_many :comments, :dependent => :destroy
  has_many :likes
  belongs_to :user

end
