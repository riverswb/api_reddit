class Subreddit < ApplicationRecord

  def self.find_or_create(subreddit)
    where(name: subreddit[:data][:display_name]).first_or_create do |new_sub|
      new_sub.name    = subreddit[:data][:display_name]
      new_sub.sidebar = subreddit[:data][:description_html]
    end
  end
end
