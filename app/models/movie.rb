class Movie < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :users, :through => :reviews

    validates :title, presence: true        
    validates :category, presence: true
    validates :about, presence: true,  length: { minimum: 7, maximum: 300, too_long: "%{count} characters is maximum allowed", too_short: "%{count} characters is minimum allowed"}
    validates :cast, presence: true

    def self.search(search)
        if search
            movie_type = Movie.find_by(title: search)
            if movie_type
                self.where(id: movie_type.id)
            else
                movie_type = Movie.find_by(about: search)
                if movie_type
                    self.where(id: movie_type.id)
                else
                  @movies = Movie.all
                end
            end
        else
            @movies = Movie.all
        end
    end
end
