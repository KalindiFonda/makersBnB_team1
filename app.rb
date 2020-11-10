require 'sinatra/base'
require './models/cat'


class CatManager < Sinatra::Base

  get '/' do
    @cats = Cat.all
    erb :index
  end

  get '/cats/:id' do
    @cat = Cat.find_by(id: params[:id])
    p @cat
    erb :"cats/cat_profile"
  end

  run! if app_file == $0

end
