class User < ApplicationRecord

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.screen_name        = auth_info.info.name
      new_user.oauth_token        = auth_info.credentials.token
      new_user.oauth_token_secret = auth_info.credentials.secret
      new_user.link_karma         = auth_info.extra.raw_info.link_karma
      new_user.comment_karma      = auth_info.extra.raw_info.comment_karma
    end
  end
end
