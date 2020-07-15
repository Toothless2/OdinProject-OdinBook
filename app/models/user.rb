class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]

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

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.username = auth.info.name
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
