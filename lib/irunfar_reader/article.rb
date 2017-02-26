class IrunfarReader::Article
  attr_accessor :title, :author, :url, :content
  
  def self.all
    self.scrape_articles
  end

  def self.scrape_articles
    articles = []
    doc = Nokogiri::HTML(open("http://www.irunfar.com/"))

    doc.css(".hpblock h2 a").each_with_index do |article, index|
      article = self.new
      article.title = doc.css(".hpblock h2 a")[index].text
      article.author = doc.css('.hpblock p a[rel="author"]')[index].text
      article.url = doc.css(".hpblock h2 a")[index].attribute("href").value
      articles << article
    end

    articles
  end

  def self.scrape_irunfar
    
  end

end