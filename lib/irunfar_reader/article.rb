class IrunfarReader::Article
  attr_accessor :title, :author, :url, :content

  @@all = []
  
  def self.all
    @@all
  end

  def self.scrape_articles
    doc = Nokogiri::HTML(open("http://www.irunfar.com/"))

    doc.css(".hpblock h2 a").each_with_index do |article, index|
      article = self.new
      article.title = doc.css(".hpblock h2 a")[index].text
      article.author = doc.css('.hpblock p a[rel="author"]')[index].text
      article.url = doc.css(".hpblock h2 a")[index].attribute("href").value
      self.all << article
    end

    self.all
  end

  def scrape_full_content
    doc = Nokogiri::HTML(open(self.url))
    self.content = doc.css(".post p").text
  end

end