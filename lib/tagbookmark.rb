require 'pg'
require_relative './bookmark.rb'
require_relative './tag.rb'
class TagBookmark
  attr_reader :bookmark_id, :tag_id
  def initialize(bookmark_id, tag_id)
    @bookmark_id = bookmark_id
    @tag_id = tag_id
  end

  def self.add_to_bookmark(bookmark, tag)
    con = PG.connect :dbname => ENV['DATABASE'], :user => USER
    result = con.exec("INSERT INTO bookmarks_tags (bookmark_id, tag_id) VALUES('#{bookmark.id}', '#{tag.id}') RETURNING bookmark_id, tag_id")
    TagBookmark.new(result.first['bookmark_id'], result.first['tag_id'])
  end
end
