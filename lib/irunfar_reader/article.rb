class IrunfarReader::Article
  attr_accessor :title, :author, :url, :content
  
  def self.all

    article_1 = self.new
    article_1.title = "2017 Transgrancanaria Live Coverage"
    article_1.author = "Bryon Powell"
    article_1.url = "http://www.irunfar.com/2017/02/2017-transgrancanaria-live-coverage.html"
    article_1.content = "The 2017 Transgrancanaria kicks off at 11 p.m. local time on Friday, February 24 in the Canary Islands (4 p.m. MST in the U.S.). We’ll be livecasting the event..."

    article_2 = self.new
    article_2.title = "The Simple Pleasure Of The Long Run"
    article_2.author = "Andy Jones-Wilkins"
    article_2.url = "http://www.irunfar.com/2017/02/the-simple-pleasure-of-the-long-run.html"
    article_2.content = "Over the past few years as ultrarunning has increased in popularity and training methods have evolved, the sport has undergone a transformation..."

    [article_1, article_2]
  end

end