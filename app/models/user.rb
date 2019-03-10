class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :ownerships
  has_many :movies, through: :ownerships
  has_many :watcheds
  has_many :watched_movies, through: :watcheds, source: :movie
  
  def watched(movie)
    self.watcheds.find_or_create_by(movie_id: movie.id)
  end
  
  def unwatched(movie)
    watched = self.watcheds.find_by(movie_id: movie.id)
    watched.destroy if watched
  end
  
  def watched?(movie)
    self.watched_movies.include?(movie)
  end
end
