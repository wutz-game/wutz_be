class JApiService

  def initialize
    @min_date = "2001-11-26" # November 26th, 2001 is the date when the moetary values of first round Jeopardy questions switched from 100-500 to 200-1000.
    @max_date = "2023-01-01"
    @offset = QuestionCategory.all.count
  end
  
  def modern_clues
    get_url("api/clues?min_date=#{@min_date}&offset=#{@offset}")
  end

  def three_random_clues
    get_url("api/random?count=3")
  end

  def clues_by_category(category_id)
    get_url("api/clues?category=#{category_id}&min_date=#{@min_date}")
  end
  
  def conn
    @_conn ||= Faraday.new("http://jservice.io/")
  end
  
  def get_url(url)
    response = conn.get(url)

    JSON.parse(response.body, symbolize_names: true)
  end
end