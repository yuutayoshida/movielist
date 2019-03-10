class OwnershipsController < ApplicationController
  def create
    @movie = Movie.find_or_initialize_by(code: params[:movie_code])
    
    unless @movie.persisted?
      result = Tmdb::Movie.detail(@movie.code)
      
      @movie = Movie.new(read(result))
      @movie.save
    end
    
    if params[:type] == 'Watched'
      current_user.watched(@movie)
      flash[:success] = 'Movieをwatchedしました。'
    end
    
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    
    if params[:type] == 'Watched'
      current_user.unwatched(@movie)
      flash[:success] = 'MovieをWatchedから削除しました。'
    end
  
    redirect_back(fallback_location: root_path)
  end
end
