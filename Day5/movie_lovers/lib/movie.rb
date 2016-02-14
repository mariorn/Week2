class Movie
  attr_accessor :title, :keys_game, :writers, :poster

  def initialize(title, date, director, cast, poster)
    @title = title
    @poster = poster
    @keys_game = {date: date,
                  director: director,
                  cast: cast
    }
  end

end

