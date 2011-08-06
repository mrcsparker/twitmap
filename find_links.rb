# twitmap
# Chris Parker <mrcsparker@gmail.com>
#
# Takes a twitter hashtag and pulls its results as a set
# of links.

require 'bundler/setup'
require 'twitmap'

def show_help
  puts "Twitmap"
  puts "-------"
  puts "To run this program, type in "
  puts "ruby ./find_links.rb \"a_hashtag\""
  puts "where \"a_hashtag\" is a twitter hash that you "
  puts "want to search and get a list of links from"
end

query = ARGV[0]
if query.strip == ""
  show_help
else
  hashtag = Twitmap::Hashtag.new(query.strip)
  hashtag.to_links.each_with_index do |link, i|
    puts "#{i}. #{link}"
  end
end
