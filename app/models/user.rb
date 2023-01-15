class User < ApplicationRecord

  has_secure_password
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :username
  validates_uniqueness_of :username
   has_one_attached :avatar
  def image_url
    Rails.application.routes.url_helpers.url_for(avatar) if avatar.attached?
  end
end
