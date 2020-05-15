class Song < ActiveRecord::Base
  belongs_to(:artist)
  belongs_to(:genre)
  has_many(:notes)

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def notes_content=(content_array)
    content_array.each do |content|
      note = Note.find_or_create_by(content: content)
      self.notes.push(note)
    end
  end

end
