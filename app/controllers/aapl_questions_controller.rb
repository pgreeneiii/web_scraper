class AaplQuestionsController < ApplicationController
  def home
    # Your code goes below.

    render("aapl_questions/home.html.erb")
  end

  def one
    # Your code goes below.

    filename = Rails.root.join("lib", "csvs", "aapl.csv")
    csv = CSV.open(filename, :headers => true, :encoding => "ISO-8859-1")

    @total_quotes = 0
    @closed_higher_than_open = 0
    @closed_lower_than_open = 0
    @declined = 0
    @increased = 0

    csv.each do |row|
      hash = row.to_hash

      @total_quotes = @total_quotes + 1

      if hash["Close"] > hash["Open"]
        @closed_higher_than_open = @closed_higher_than_open + 1
      end

      if hash["Close"] < hash["Open"]
        @closed_lower_than_open = @closed_lower_than_open + 1
      end

      if hash["High"] <= hash["Open"]
        @declined = @declined + 1
      end

      if hash["Low"] >= hash["Open"]
        @increased = @increased + 1
      end
    end

    render("aapl_questions/one.html.erb")
  end

  def two
    # Your code goes below.

    render("aapl_questions/two.html.erb")
  end

  def three
    # Your code goes below.

    render("aapl_questions/three.html.erb")
  end

  def four
    # Your code goes below.

    render("aapl_questions/four.html.erb")
  end

  def five
    # Your code goes below.

    render("aapl_questions/five.html.erb")
  end
end
