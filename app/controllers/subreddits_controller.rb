class SubredditsController < ApplicationController
  def index
    conn = Faraday.new
    response = conn.get 'https://oauth.reddit.com/subreddits/mine/subscriber' do |req|
      req.headers[:Authorization] = "bearer #{current_user.oauth_token}"
    end
    @subreddits = JSON.parse(response.body, symbolize_names: true)[:data][:children].map do |subreddit|
      Subreddit.find_or_create(subreddit)
    end
  end

  def show
    @subreddit = Subreddit.find(params[:id])
  end

end

# class Subreddit
#   attr_reader :name, :sidebar
#   def initialize(attrs = [])
#     @name = attrs[:data][:display_name]
#     @sidebar = attrs[:data][:description_html]
#   end
# end
