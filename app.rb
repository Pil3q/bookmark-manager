require 'sinatra/base'
require_relative './lib/bookmark.rb'

class BookmarkManager < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :display
  end

  get '/add_bookmark' do
    erb :add_bookmark
  end

  post '/submit_new' do
      flash[:error] = "#{params[:url]} is not valid URL" unless Bookmark.add(params)
      redirect ('/')
  end
end
