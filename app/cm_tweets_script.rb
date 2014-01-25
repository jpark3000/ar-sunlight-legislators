require_relative 'models/congress_member'
require_relative 'models/tweet'
require 'twitter'


def cm_with_twitter
  CongressMember.where.not(twitter_id: "")
end

def load_cm_tweets
  cm_with_twitter.each do |cm|
    tweet_array = cm.get_tweets
    tweet_array.each do |t|
      cm.tweets << Tweet.create(tweet_id: t.id, content: t.text)
    end
  end
end

# load_cm_tweets
