require 'sinatra/base'
require './models/cat'
require './database_connection_setup'


class CatManager < Sinatra::Base

  get '/' do
    @cats = Cat.all
    erb :index
  end

  get '/cats/:id' do
    @cat = Cat.find_by(id: params[:id])
    erb :"cats/cat_profile"
  end

  get '/add' do
    erb :"add_cat"
  end

  post '/add_cat' do
    @Cat_new = Cat.create(name: params[:name],description: params[:description] , picture: params[:picture], price: params[:price])
    redirect '/'
  end

  run! if app_file == $0

end
