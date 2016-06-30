require 'twitter'
require './tweet.rb'

class TwitterAPI

  CONSUMER_KEY = "YOUR KEY HERE"
  CONSUMER_SECRET = "YOUR SECRET HERE"
  ACCESS_TOKEN = "YOUR KEY HERE"
  ACCESS_TOKEN_SECRET = "YOUR SECRET HERE"

  attr_accessor :client

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = CONSUMER_KEY
      config.consumer_secret     = CONSUMER_SECRET
      config.access_token        = ACCESS_TOKEN
      config.access_token_secret = ACCESS_TOKEN_SECRET
    end
  end

  def search(pattern, since_id=0)
    tweets = []

    client.search(pattern, { :since_id => since_id }).take(30).each do |tweet|
      puts "adding tweet: #{tweet.id}"
      tweets << Tweet.new(tweet.id, tweet.text)
    end

    return tweets
  end
end
