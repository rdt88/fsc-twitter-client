#require "./tweet.rb"
require "./twitter_api.rb"

api = TwitterAPI.new
tweets = api.search("#Brexit")

10.times do |i|
  puts tweets[i].text
end
