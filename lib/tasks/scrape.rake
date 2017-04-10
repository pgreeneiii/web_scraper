namespace :scrape do
  desc "Scrape IMDb Movies Coming Soon and output CSV"
  task movies: :environment do
    page = HTTParty.get('http://www.imdb.com/movies-coming-soon/')
    parse_page = Nokogiri::HTML(page)

    csv = CSV.open("movie.csv", "wb")

    parse_page.css("tbody").each do |movie|
      title = movie.css(".overview-top h4 a").text
      director = movie.css(".outline+ .txt-block a").text
      genres = movie.css(".cert-runtime-genre span").text
      duration = movie.css("time").text
      description = movie.css(".overview-top .outline").text

      puts "************************************************"
      puts "Movie:  #{title}"
      puts " Director: #{director}"
      puts " Genres: #{genres}"
      puts " Duration: #{duration}"
      puts"  Description: #{description}"

      csv << [title, director, genres, duration, description]

    end
  end
end
