class ApiCaller
  include HTTParty
  base_uri 'safe-plains-5453.herokuapp.com'

  def bill
    self.class.get("/bill.json")
  end
end