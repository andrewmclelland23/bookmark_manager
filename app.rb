require 'sinatra/base'
require 'uri'
require 'sinatra/flash'
require_relative 'lib/bookmarks'

# Web app class
class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/bookmarks/add' do
    erb :'bookmarks/add'
  end

  post '/bookmarks/add' do
    flash[:notice] = 'Invalid URL entered' unless Bookmarks.add_bookmark(params[:url], params[:title])
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.display_all
    erb :bookmarks
  end

  delete '/bookmarks/:id' do
    Bookmarks.delete_bookmark(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmarks.find(id: params[:id])
    erb :"bookmarks/edit"
  end

  patch '/bookmarks/:id' do
    Bookmarks.update_bookmark(url: params[:url], title: params[:title], id: params[:id])
    redirect('/bookmarks')
  end

  run! if app_file == $0
end
