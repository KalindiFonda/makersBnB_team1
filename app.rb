require 'sinatra/base'
require './models/cat'


class CatManager < Sinatra::Base
  get '/' do
    @cats = Cat.all
  end

  run! if app_file == $0

end
