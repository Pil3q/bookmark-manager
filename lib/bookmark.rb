require 'pg'
require 'sinatra/flash'
require_relative '../local.rb'

ENV['DATABASE'] = 'bookmark_manager'

class Bookmark

  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all

    begin

        con = PG.connect :dbname => ENV['DATABASE'], :user => USER

        rs = con.exec("SELECT * FROM bookmarks")
        rs.map { |bookmark| Bookmark.new(bookmark['id'], bookmark['url'], bookmark['title']) }

    rescue PG::Error => e

        puts e.message

    ensure

        rs.clear if rs
        con.close if con
    end
  end

  def self.add(params)
    return false unless valid?(params[:url])
    con = PG.connect :dbname => ENV['DATABASE'], :user => USER
    result = con.exec("INSERT INTO bookmarks(url, title) VALUES('#{params[:url]}', '#{params[:title]}') RETURNING id, url, title")
    Bookmark.new(result.first['id'], result.first['url'], result.first['title'])
  end

  def ==(other)
  @id == other.id
  end

  def self.update(old, update)
    con = PG.connect :dbname => ENV['DATABASE'], :user => USER
    con.exec("UPDATE bookmarks SET url='#{update[:url]}' WHERE title='#{old.title}' OR url='#{old.url}'") unless update[:url] == nil
    con.exec("UPDATE bookmarks SET title='#{update[:title]}' WHERE title='#{old.title}' OR url='#{old.url}'") unless update[:title] == nil
  end

  def self.delete(params)
    con = PG.connect :dbname => ENV['DATABASE'], :user => USER
    result = con.exec("DELETE FROM bookmarks WHERE title='#{params[:title]}' OR url='#{params[:url]}'")
  end

  def self.find(params)
    con = PG.connect :dbname => ENV['DATABASE'], :user => USER
    result = con.exec("SELECT * FROM bookmarks WHERE title='#{params[:title]}' OR url='#{params[:url]}'")
    Bookmark.new(result.first['id'], result.first['url'], result.first['title'])
  end

  private

  def self.valid?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end
end
