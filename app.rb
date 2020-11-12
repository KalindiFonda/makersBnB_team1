require 'sinatra/base'
require './models/cat'
require './models/booking'
require './models/database_connection'
require 'sinatra/flash'
require 'simple_calendar'
require './models/users'
require './database_connection_setup'


class CatManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  set :session_secret, "here be dragons"

  get '/' do
    @cats = Cat.all
    @user = User.find(id: session[:user_id])
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
    Cat.create(name: params[:name],description: params[:description] ,
      picture: params[:picture], price: params[:price])
    redirect '/'
  end

  post '/cats/:id/book' do
    @user = User.create(email: params[:email],
      password: params[:password])
    session[:user_id] = @user.id
    # TODO: this is probably pretty bad
    # create user as there is no user
    Booking.create(cat_id: params[:id],
      booking_start: params[:start_date],
      booking_end: params[:end_date],
      user_id: session[:user_id])
    flash[:notice] = "You made a booking request."
    redirect "cats/#{params[:id]}"
  end

  get '/users/new' do
  erb :"users/new"
end

post '/users' do
  @user = User.create(email: params[:email],
    password: params[:password])
  session[:user_id] = @user.id
  redirect '/'
end

  run! if app_file == $0

end
