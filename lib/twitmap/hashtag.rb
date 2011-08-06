require 'set'

module Twitmap
  class Hashtag

    # params [String] the hash being searched
    def initialize(htag)
      @htag = cleanup_hashtag(htag)
      @search = Twitter::Search.new
      @search.hashtag(@htag)
    end

    # @return [String] the hashtag
    def to_s
      "##{@htag}"
    end

    # Returns a hashtag query as a set of links
    # @param [Integer] the number of pages to return
    # @return [Set] a set of links.
    #
    # @note A set was chosen because it does not allow duplicates \ 
    #   why reinvent the wheel?
    def to_links(per_page = 100)
      htag_set = Set.new

      search = Twitter::Search.new
      @search.per_page(100).fetch.each do |msg|
        links = msg.text.split(" ").select { |f| f.strip =~ /^https?:/ }
        links.each { |link| htag_set.add(link.strip) }
      end

      htag_set
    end

    # For this code, this is here for testing.
    # @return [Array] the query results.
    def all(per_page = 100)
      @search.per_page(per_page).fetch
    end

    private

    # @params [String] String with spaces, maybe
    # @return [String] String without spaces
    def cleanup_hashtag(old_htag)
      old_htag.gsub(" ", "")
    end
  end
end
