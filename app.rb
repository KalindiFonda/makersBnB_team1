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

  run! if app_file == $0

end
