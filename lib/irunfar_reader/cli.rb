class IrunfarReader::CLI
  
  def call
    list_articles
    menu
  end

  def list_articles
    puts ""
    puts "----------------------------------"
    puts "Welcome to the iRunFar.com Reader!"
    puts "----------------------------------"
    @articles = IrunfarReader::Article.all
    @articles.each.with_index(1) do |article, i|
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

      if input.to_i > 0
        the_article =  @articles[input.to_i - 1]
        puts ""
        puts "#{the_article.title} - #{the_article.author}"
        puts "-----"
        puts the_article.content
        puts ""
      elsif input == "list"
        list_articles
      elsif input == "exit"
        goodbye
      else
        puts "Not sure what you want, please type 'list' or 'exit'."
      end
    end
  end

  def goodbye
    puts "Thanks for reading!"
  end

end