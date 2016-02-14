class Post

  attr_reader :date, :title, :text, :sponsor

  def initialize(title, date, text, sponsor = false)
    if(sponsor)
      @title = "****" + title + "****"
    else
      @title = title
    end
    @date = date
    @text = text
    @sponsor = sponsor
  end


end

