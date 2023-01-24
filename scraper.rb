require 'open-uri'
require 'nokogiri'
require 'pry'

def fetch_movies_url
    imdb = URI.open("https://www.imdb.com/chart/top").read
    document = Nokogiri::HTML.parse(imdb)
    movies = document.search(".titleColumn a")
    links =[]
    movies.take(5).each do |movie| 
        links << "https://www.imdb.com#{movie.attribute("href").value}"
    end 
    return links
end

def scrape_movie(url)
    binding.pry
    document = Nokogiri::HTML.parse(URI.open(url).read)
    title = document.search("h1").innerText
    cast = document.search(".ipc-metadata-list-item__list-content-item").text.strip
    director = document.search(".ipc-metadata-list-item__list-content-item--link").text.strip
    storyline = document.search(".sc-16ede01-6").text.strip
    return {
        title: title,
        cast: cast,
        director: director,
        storyline: storyline
    }
end
