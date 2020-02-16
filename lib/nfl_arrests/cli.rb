class NflArrests::CLI    
  
  def call 
    puts "Welcome to the NFL Arrest List. All suspects are innocent until proven guilty."
    puts " "
    puts "If you're curious about the players on this list, type 'see players'."
    API.get_data
    menu
  end

  def menu 
    input = gets.strip.downcase  
    if input == "see players"
      player_list
      menu
    elsif input == "exit"
      goodbye      
    else 
      invalid_entry
    end
  end

  def player_list
    Player.all.each.with_index(1) do |player, index|
      puts "#{index}. #{player.Name}"
    end 
    
    puts "Enter the player's name that you want more info about."
    input = gets.strip.downcase  
    player_info(input)  
    puts "Type 'see players' if you want to search again. Otherwise, type 'exit'."
    
    menu
  end   
  
  def player_info(input)
    puts "Nice choice. Here are the results:"
    player = Player.find_by_name(input)
    player.each do |p|
      puts "-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~"
      puts "#{p.Name} was arrested during the #{p.Season} season. It has been #{p.DaysSince} days since this arrest."
      puts "   Team: #{p.Team_preffered_name}"
      puts "   City: #{p.Team_city}"
      puts "   Position: #{p.Position_name}"
      puts "   Description: #{p.Description}"
      puts "   Outcome: #{p.Outcome}"
      puts "-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~"
    end
  end   
  
  def goodbye
    puts "Goodbye. Remember to never to speak to the police without a lawyer!"
    exit
  end   
  
  def invalid_entry
    puts "Invalid entry, try again"
    menu
  end
end  