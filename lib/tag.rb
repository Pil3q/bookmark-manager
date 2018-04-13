require 'pg'
require_relative './bookmark.rb'
class Tag
  attr_reader :id, :text
  def initialize(id, text)
    @id = id
    @text = text
  end

  def self.add(params)
    con = PG.connect :dbname => ENV['DATABASE'], :user => USER
    result = con.exec("INSERT INTO tags(tag) VALUES('#{params[:tag]}') RETURNING id, tag")
    Tag.new(result.first['id'], result.first['tag'])
  end

  def self.find(params)
    con = PG.connect :dbname => ENV['DATABASE'], :user => USER
    result = con.exec("SELECT * FROM tags WHERE tag='#{params[:tag]}'")
    Tag.new(result.first['id'], result.first['tag'])
  end

  def self.bookmark_list(tag)
    con = PG.connect :dbname => ENV['DATABASE'], :user => USER
    result = con.exec("SELECT bookmarks.id, url, title FROM bookmarks_tags INNER JOIN bookmarks ON bookmarks.id = bookmarks_tags.bookmark_id WHERE bookmarks_tags.tag_id = #{tag.id}")
    result.map { |bookmark| Bookmark.new(bookmark['id'], bookmark['url'], bookmark['title']) }
  end
end
