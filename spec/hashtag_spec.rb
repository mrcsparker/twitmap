require 'spec_helper'

require 'set'

describe Twitmap::Hashtag do 
  it "should store the default search hashtag" do
    search = Twitmap::Hashtag.new("samplehashtag")
    search.to_s.should == "#samplehashtag"
  end

  it "should combine hashtags with spaces" do
    search = Twitmap::Hashtag.new("sample hash tag")
    search.to_s.should == "#samplehashtag"
  end

  # This is so that we can just test a local search
  # It is much easier to just keep a local version of this in the fixtures
  # directory than to rely on twitter.
  describe "local search" do

    before(:each) do
      stub_request(:get, "https://search.twitter.com/search.json?q=%23twitter&rpp=100").
        to_return(:body => fixture("search.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "should return 93 links" do
      hashtag = Twitmap::Hashtag.new("twitter")
      hashtag.to_links.size.should == 93
    end
  
    it "should have the correct links returned" do
      hashtag = Twitmap::Hashtag.new("twitter")
      hashtag.to_links.sort.first.should == "http://adpro.co/n7oiLO"
      hashtag.to_links.sort.last.should == "http://www.voyagerprowheretobuy.com"
    end

    it "should return 100 results" do
      hashtag = Twitmap::Hashtag.new("twitter")
      hashtag.all.size.should == 100
    end

    it "should contain only links" do
      hashtag = Twitmap::Hashtag.new("twitter")
      hashtag.to_links.each do |link|
        link.should =~ /^https?:/
      end
    end

  end
end
