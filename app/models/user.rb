class User < ApplicationRecord
  extend FriendlyId
  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email
  
  validates_presence_of :username
  validates_uniqueness_of :username

  has_one_attached :avatar

  def should_generate_new_friendly_id?
    username_changed? || slug.blank?
  end
end
