class Comment
  attr_reader :id, :text
  def initialize(id, text)
    @id = id
    @text = text
  end

  def self.add(bookmark, params)
    con = PG.connect :dbname => ENV['DATABASE'], :user => USER
    result = con.exec("INSERT INTO comments(bookmark_id, comment) VALUES('#{bookmark.id}', '#{params[:comment]}') RETURNING bookmark_id, comment")
    Comment.new(result.first['bookmark_id'], result.first['comment'])
  end
end
