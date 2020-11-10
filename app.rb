require 'sinatra/base'
require './models/cat'
require './models/booking'
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
    # Do you need cat_new instance variable?
    @Cat_new = Cat.create(name: params[:name],description: params[:description] , picture: params[:picture], price: params[:price])
    redirect '/'
  end

  post '/cats/:id/book' do
    Booking.create(cat_id: params[:id],  booking_start: params[:start_date], booking_end: params[:end_date], user_id: 10)
    redirect "cats/#{:id}"
  end

  run! if app_file == $0

end
