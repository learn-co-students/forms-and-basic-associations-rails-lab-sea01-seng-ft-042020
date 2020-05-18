class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  accepts_nested_attributes_for :notes, reject_if: proc {|attributes| attributes['content'].blank? }


  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)

  end

  def artist_name
    artist ? artist.name : nil
  end

  def genre_id=(id)
    self.genre = Genre.find(id)
  end

  def genre_id
    genre ? genre.name : nil
  end



end
