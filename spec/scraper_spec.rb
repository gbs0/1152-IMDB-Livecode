require_relative '../scraper'
require 'nokogiri'

describe "#fetch_movies_url" do
  it "Return an array with 5 movies url" do
    urls = fetch_movies_url
    expect = [
        "https://www.imdb.com/title/tt0111161/",
        "https://www.imdb.com/title/tt0068646/",
        "https://www.imdb.com/title/tt0468569/",
        "https://www.imdb.com/title/tt0071562/",
        "https://www.imdb.com/title/tt0050083/"
    ]
    expect(urls).to eq(expect)
  end
end

describe "#scrape_movie" do
  it "Return a Hash with movies info" do
    the_dark_knight_url = "https://www.imdb.com/title/tt0468569"
    movie = scrape_movie(the_dark_knight_url)
    expected = {
        cast: ["Christian Bale", "Heath Ledger", "Aaron Eckhart"],
        director: "Christopher Nolan",
        storyline: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
        title: "The Dark Knight"
    }
    expect(movie).to eq(expected)
  end
end