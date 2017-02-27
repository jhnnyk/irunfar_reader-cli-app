class IrunfarReader::Article
  attr_accessor :title, :author, :url, :content

  @@all = []
  
  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def content
    @content ||= IrunfarReader::Scraper.new.scrape_full_content(self)
  end

end