require 'sinatra/base'
require './models/cat'
require './models/booking'
require './models/database_connection'
require './database_connection_setup'
require 'sinatra/flash'
require 'simple_calendar'
require './models/user'


class CatManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  set :session_secret, "here be dragons"

  get '/' do
    @cats = Cat.all
    @user = User.find(id: session[:user_id])
    erb :index
  end

  get '/login' do
    erb :signupin
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
    redirect '/main'
  end

  post '/cats/:id/book' do
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

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])

    if user
      session[:user_id] = user.id
      redirect('/')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/')
  end

  post '/my_cats' do
    @user = User.create(email: params[:email],
      password: params[:password])
    session[:user_id] = @user.id
    @users_cats =  User.all
  end

  run! if app_file == $0

end
