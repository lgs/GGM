require 'goliath'
require 'em-synchrony'
require 'em-synchrony/em-mongo'
require 'grape'
require 'yajl'
require 'yajl/json_gem'

class API < Grape::API
  
  version 'v1', :using => :path
  format :json
  
  resource 'categories' do
    # http://0.0.0.0:9000/v1/categories/
    get "/" do
      coll = env.mongo.collection('categories') #Connection Pool from Goliath ENV
      coll.find({})
    end
  end
end

class App < Goliath::API
  def response(env)
    API.call(env)
  end
end

