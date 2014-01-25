require_relative '../../db/config'
require 'twitter'

class CongressMember < ActiveRecord::Base
  has_many :tweets

  def get_tweets
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = "LZYeq1J3XbUDGkH59PDuTA"
      config.consumer_secret = "S5ol0PZBcnnnVdklLnZe3DPD26WeOMM2tdvzXMLzMM"
    end

    client.user_timeline(twitter_id, count: 10)
  end
end

