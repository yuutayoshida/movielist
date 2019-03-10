class ToppagesController < ApplicationController
  def index
    @movies = Movie.order('updated_at DESC')
  end
end
