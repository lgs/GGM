require 'goliath'
require 'em-synchrony'
require 'em-synchrony/em-mongo'
require 'grape'

class API < Grape::API
  
  version 'v1', :using => :path
  format :json
  
  resource 'clients' do

    # http://0.0.0.0:9000/v1/clients/

    get "/" do
      coll = env.mongo.collection('clients') #Connection Pool from Goliath ENV
      coll.find({})
    end
    
  end

end



class App < Goliath::API
  def response(env)
    API.call(env)
  end
end

