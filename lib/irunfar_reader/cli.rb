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
    puts "----------------------------------"
  end

  def menu
    input = nil

    while input != 'exit'
      puts "Enter the number of the article you'd like to read,"
      puts "or 'list' to list the articles again,"
      puts "or 'exit' to exit the program."
      input = gets.strip.downcase

      case input
      when "1"
        puts "Article 1 content..."
      when "2"
        puts "Article 2 content..."
      when "list"
        list_articles
      when "exit"
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