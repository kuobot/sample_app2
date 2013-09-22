class Micropost < ActiveRecord::Base
  attr_accessible :content, :title
  belongs_to :user

  validates :user_id, presence: true
  # validates :content, presence: true, length: { maximum: 3000 }

  default_scope order: 'microposts.created_at DESC'

  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", 
          user_id: user.id)
  end
  def is_today
    created_at.today?
  end
end