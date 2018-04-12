require 'sinatra/base'
require_relative './lib/bookmark.rb'

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
end
