class IrunfarReader::Scraper
  
  def scrape_articles
    doc = Nokogiri::HTML(open("http://www.irunfar.com/"))

    doc.css(".hpblock h2 a").each_with_index do |article, index|
      a = IrunfarReader::Article.new
      a.title = doc.css(".hpblock h2 a")[index].text
      a.author = doc.css('.hpblock p a[rel="author"]')[index].text
      a.url = doc.css(".hpblock h2 a")[index].attribute("href").value
      a.save
    end
  end

  def scrape_full_content(article)
    doc = Nokogiri::HTML(open(article.url))
    article.content = doc.css(".post p").text
  end

end