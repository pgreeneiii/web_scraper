namespace :scrape do
  desc "Scrape IMDb Movies Coming Soon and output CSV"
  task movies: :environment do
    # url = "http://www.imdb.com/movies-coming-soon/"
    # page = HTTParty.get(url)

    filename = Rails.root.join("lib", "imdb", "movies-coming-soon.html")
    page = open(filename)

    doc = Nokogiri::HTML(page)

    list_of_movies = []

    doc.css("tbody").each do |movie|
      movie_hash = {}

      movie_hash[:title] = movie.css(".overview-top h4 a").text
      puts "Movie: #{movie_hash[:title]}"

      movie_hash[:director] = movie.css(".outline+ .txt-block a").text
      puts "Director: #{movie_hash[:director]}"

      movie_hash[:genres] = movie.css(".cert-runtime-genre span").text
      puts "Genres: #{movie_hash[:genres]}"

      movie_hash[:duration] = movie.css("time").text
      puts "Duration: #{movie_hash[:duration]}"

      movie_hash[:description] = movie.css(".overview-top .outline").text
      puts "Description: #{movie_hash[:description]}"

      puts "************************************************"

      list_of_movies << movie_hash
    end

    ap list_of_movies

    list_of_movies.to_csv("coming_soon.csv")
  end
end
