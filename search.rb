require "twitter"
require 'yaml'

key  = YAML.load_file( "conf.yaml" )

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = key["con_key"]
  config.consumer_secret     = key["con_sec"]
	config.access_token        = key["acc_token"]
	config.access_token_secret = key["acc_sec"]
end

=begin
client.search("nowplaying", :rpp => 10, :result_type => "recent").each do |status|
  puts "#{status.text}"
end
=end

word = "nowplayng" 
 
results = client.search(word, :count => 10, :result_type => "recent")
  
results.attrs[:statuses].each do |tweet|
  puts Time.parse(tweet[:created_at])
  puts tweet[:id]
  puts "@" + tweet[:user][:screen_name]
  puts tweet[:text]
  puts
end
