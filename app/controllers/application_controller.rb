class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :refresh_user
  attr_reader :current_user
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def refresh_user
    if @current_user.is_expired?
      conn = Faraday.new(url: 'https://www.reddit.com/api/v1/access_token')
      conn.basic_auth(ENV["REDDIT_API_CLIENT_ID"], ENV["REDDIT_API_SECRET_KEY"])
      response = conn.post do |req|
        req.params[:grant_type] = "refresh_token"
        req.params[:refresh_token] = "#{current_user.refresh_token}"
      end
      @current_user.update(request.env['omniauth.auth'])
    end
  end

end
