class JApiService

    def initialize
        @min_date = "2001-11-26" # November 26th, 2001 is the date when the moetary values of first round Jeopardy questions switched from 100-500 to 200-1000.
        @max_date = "2023-01-01"
    end

    def conn
        Faraday.new("http://jservice.io/")
    end

    def get_url(url)
        response = conn.get(url) do |r|
        end
        JSON.parse(response.body, symbolize_names: true)
    end

    def get_clues(category)
        get_url("api/clues?category=#{category}&min_date=#{@min_date}&max_date=#{@max_date}")
    end
end