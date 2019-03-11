class MoviesController < ApplicationController
  def new
    @movies = []
    
    @keyword = params[:keyword]
    if @keyword.present?
      results = Tmdb::Search.movie(
        @keyword,
        page: 1
      )
      
      results.results.each do |result|
        movie = Movie.find_or_initialize_by(read(result))
        @movies << movie
      end
    end
    
   
  end
  
  def show
    @movie = Movie.find(params[:id])
    @watched_users = @movie.watched_users
  end
  
  private
  
  def read(result)
    code = result['id']
    name = result['title']
    image_url = result['poster_path']
    
    {
      code: code,
      name: name,
      image_url: image_url
    }
  end
end
