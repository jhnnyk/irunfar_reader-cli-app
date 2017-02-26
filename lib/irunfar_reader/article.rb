class IrunfarReader::Article
  attr_accessor :title, :author, :url, :content
  
  def self.all
    self.scrape_articles
  end

  def self.scrape_articles
    articles = []

    # go to irunfar.com
    # extract the properties
    # instantiate an article
    # put the article in the articles array

    articles << self.scrape_irunfar

    articles
  end

  def self.scrape_irunfar
    doc = Nokogiri::HTML(open("http://www.irunfar.com/"))

    article = self.new
    article.title = doc.css(".hpblock h2 a")[0].text
    article.author = doc.css('.hpblock p a[rel="author"]')[0].text
    article.url = doc.css(".hpblock h2 a")[0].attribute("href").value
    article
  end

end