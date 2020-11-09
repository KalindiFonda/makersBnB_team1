require 'sinatra/base'


class CatManager < Sinatra::Base
  get '/' do
    'Look at all these cats'
  end

  run! if app_file == $0

end
