class IrunfarReader::CLI
  
  def call
    IrunfarReader::Scraper.new.scrape_articles
    list_articles
    menu
  end

  def list_articles
    puts ""
    puts "----------------------------------"
    puts "Welcome to the iRunFar.com Reader!"
    puts "----------------------------------"
    IrunfarReader::Article.all.each.with_index(1) do |article, i|
      puts "#{i}. #{article.title} - #{article.author}"      
    end
    puts "----------------------------------"
  end

  def menu
    input = nil

    while input != 'exit'
      puts "Enter the number of the article you'd like to read,"
      puts "or 'list' to list the articles again,"
      puts "or 'exit' to exit the program."
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i <= IrunfarReader::Article.all.size
        show_article(input.to_i - 1)
      elsif input == "list"
        list_articles
      elsif input == "exit"
        goodbye
      else
        puts "Not sure what you want, please type 'list' or 'exit'."
      end
    end
  end

  def show_article(i)
    the_article =  IrunfarReader::Article.all[i]
    puts ""
    puts "#{the_article.title} - #{the_article.author}"
    puts "-----"
    puts the_article.content
    puts ""
  end

  def goodbye
    puts "Thanks for reading!"
  end

end