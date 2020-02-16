class Player
  attr_accessor :Name, :Team_preffered_name, :Team_city, :Position_name, :Season, :Description, :Outcome, :DaysSince

  @@all = []

  def initialize(attr_hash)
    attr_hash.each do |k, v|
      self.send("#{k}=", v) if self.respond_to?("#{k}=")
    end
    save
  end 

  def save
    @@all << self
  end 

  def self.all
    @@all
  end 
    
  def self.find_by_name(name)
    self.all.select do |player|
      player.Name.downcase == name
    end 
  end 
end 