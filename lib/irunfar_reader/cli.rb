class IrunfarReader::CLI
  
  def call
    puts "Welcome to the iRunFar.com Reader!"
    list_articles
  end

  def list_articles
    puts <<~DOC
      1. 2017 Transgrancanaria Live Coverage
      2. 2017 Transgrancanaria Preview
      3. The Simple Pleasure Of The Long Run
      4. Didrik Hermansen Pre-2017 Transgrancanaria Interview
    DOC
  end

end