class Song < ActiveRecord::Base
  # add associations here
  has_many :notes
  belongs_to :artist
  belongs_to :genre
  accepts_nested_attributes_for :notes, reject_if: proc { |attributes| attributes['content'].blank? }


  def song_genre_id=(id)
    self.genre = Genre.find_by(id)
  end

  def song_genre_id
    self.genre ? self.genre.name : nil
  end

  def messages=(ids)
    ids.each do |id|
      note = Note.create(id)
      self.notes << note
    end
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end
  
  def artist_name
    self.artist ? self.artist.name : nil
  end
end
