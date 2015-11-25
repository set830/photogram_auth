class Photo < ActiveRecord::Base
  validates :user, :presence => true
  has_many :comments, :dependent => :destroy
  has_many :likes, :dependent => :destroy
  has_many :fans, :through => :likes, :source => :user
  belongs_to :user

end
