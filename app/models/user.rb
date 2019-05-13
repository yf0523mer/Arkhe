class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   has_many :posts, dependent: :destroy
   has_many :comments, dependent: :destroy
   has_many :favorites, dependent: :destroy
   attachment :image

   has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
   has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
   has_many :following, through: :active_relationships, source: :followed
   has_many :followers, through: :passive_relationships, source: :follower

   def active_for_authentication?
    super && self.deleted == false
  end

   def follow(other_user)
      following << other_user
   end

  # ユーザーをフォロー解除する
   def unfollow(other_user)
      active_relationships.find_by(followed_id: other_user.id).destroy
   end

  # 現在のユーザーがフォローしてたらtrueを返す
   def following?(other_user)
      following.include?(other_user)
   end

   # ユーザーのステータスフィードを返す
  def feed
      following_ids = "SELECT followed_id FROM relationships
                     WHERE  follower_id = :user_id"
      Post.where("user_id IN (#{following_ids})", user_id: id)
  end
end
