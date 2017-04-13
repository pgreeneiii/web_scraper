namespace :solutions do
  desc "Scrape IMDb Movies Coming Soon and output CSV"
  task movies: :environment do
    # url = "http://www.imdb.com/movies-coming-soon/"
    # page = HTTParty.get(url)

    filename = Rails.root.join("lib", "imdb", "movies-coming-soon.html")
    page = open(filename)

    doc = Nokogiri::HTML(page)

    list_of_movies = []

    doc.css(".overview-top").each do |movie|
      movie_hash = {}

      movie_hash[:title] = movie.css("h4 a").text.strip
      puts "Movie: #{movie_hash[:title]}"

      movie_hash[:director] = movie.css(".outline+ .txt-block a").text.strip
      puts "Director: #{movie_hash[:director]}"

      movie_hash[:genres] = movie.css(".cert-runtime-genre span").text.strip
      puts "Genres: #{movie_hash[:genres]}"

      movie_hash[:duration] = movie.css("time").text.strip
      puts "Duration: #{movie_hash[:duration]}"

      movie_hash[:description] = movie.css(".outline").text.strip
      puts "Description: #{movie_hash[:description]}"

      puts "************************************************"

      list_of_movies.push(movie_hash)
    end

    ap list_of_movies

    list_of_movies.to_csv("coming_soon.csv")
  end
end
