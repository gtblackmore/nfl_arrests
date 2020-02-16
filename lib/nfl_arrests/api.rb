class API 

  def self.get_data
    results = RestClient.get("http://nflarrest.com/api/v1/crime/arrests/Theft")
    player_array = JSON.parse(results.body)
    player_array.each{|p| Player.new(p)}
  end 
end 