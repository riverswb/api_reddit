class User < ApplicationRecord

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.screen_name        = auth_info.info.name
      new_user.oauth_token        = auth_info.credentials.token
      new_user.refresh_token      = auth_info.credentials.refresh_token
      new_user.token_expiration   = auth_info.credentials.expires_at
      new_user.link_karma         = auth_info.extra.raw_info.link_karma
      new_user.comment_karma      = auth_info.extra.raw_info.comment_karma
    end
  end

  def update(auth_info)
    find_by(uid: auth_info[:uid]) do |update|
      update.oauth_token = auth_info.credentials.token
      update.refresh_token = auth_info.credentials.refresh_token
      update.token_expiration = auth_info.expires_at + update.token_expiration
    end
  end

  def is_expired?
    Time.now.to_i >= @current_user.token_expiration.to_i
  end
end
