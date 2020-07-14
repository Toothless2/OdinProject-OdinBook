class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy # posts user has made
  has_many :likes, dependent: :destroy # posts user has likes
  has_many :liked_posts, through: :posts, source: :likes # posts user has made that have been liked

  has_many :sentrequests, class_name: 'Friend', dependent: :destroy, foreign_key: :sender
  has_many :recivedrequests, class_name: 'Friend', dependent: :destroy, foreign_key: :recipient

  has_and_belongs_to_many :friends, foreign_key: :pal_id, join_table: :relations, class_name: 'User', dependent: :destroy

  def addFriend(friend)
    friends << friend
    friend.friends << self
  end

  def removeFriend(friend)
    friend.friends.delete(self)
    friends.delete(friend)
  end
end
