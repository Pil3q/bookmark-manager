require 'sinatra/base'
require_relative './lib/bookmark.rb'
require_relative './lib/comment.rb'
require_relative './lib/tag.rb'
require_relative './lib/tagbookmark.rb'
class BookmarkManager < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/add_bookmark' do
    erb :add_bookmark
  end

  post '/submit_new' do
      flash[:error] = "#{params[:url]} is not valid URL" unless Bookmark.add(params)
      redirect ('/')
  end

  get '/delete_bookmark' do
    erb :delete_bookmark
  end

  post '/submit_delete' do
    Bookmark.delete(params)
    redirect ('/')
  end

  get '/update_bookmark' do
    erb :update_bookmark
  end

  post '/submit_update' do
    session[:link] = Bookmark.find(params)
    redirect ('/update_bookmark_with')
  end

  get '/update_bookmark_with' do
    erb :update_bookmark_with
  end

  post '/submit_update_with_changes' do
    Bookmark.update(session[:link], params)
    redirect ('/')
  end

  get '/comment' do
    erb :comment
  end

  post '/submit_comment' do
    session[:comment] = Bookmark.find(params)
    redirect ('/comment_add')
  end

  get '/comment_add' do
    erb :comment_add
  end
  post '/submit_comment_add' do
    Comment.add(session[:comment], params)
    redirect ('/')
  end
  get '/tag_add' do
    erb :add_tag
  end
  post '/submit_tag' do
    Tag.add(params)
    redirect ('/')
  end
  get '/tag_add_to' do
    erb :add_tag_to
  end
  post '/submit_tag_to' do
    session[:tag] = Bookmark.find(params)
    redirect ('/add_tag_to_bookmark')
  end
  get '/add_tag_to_bookmark' do
    erb :add_tag_to_bookmark
  end
  post '/submit_tag_to_bookmark' do
    TagBookmark.add_to_bookmark(session[:tag], Tag.find(params))
    redirect('/')
  end
  get '/sort_by_tag' do
    erb :sort_by_tag
  end
  post '/submit_sort_by_tag' do
    session[:sort] = Tag.bookmark_list(Tag.find(params))
    redirect('/sorted_by_tag')
  end
  get '/sorted_by_tag' do
    @bookmarks = session[:sort]
    erb :sorted_index
  end
end
