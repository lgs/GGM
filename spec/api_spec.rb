require 'spec_helper'

describe API do
  include Rack::Test::Methods

  def app
    API
  end

  describe API do
    describe 'GET /api/v1/hello' do
      it 'says hello to the world' do
        get "/api/v1/hello"
        last_response.status.should == 200
        JSON.parse(last_response.body)["hello"].should == "world"
      end
    end

    describe 'GET /api/v1/gengiscan' do
      it 'returns a 404 error if no host is provided' do
        get "/api/v1/gengiscan"
        last_response.status.should == 404
      end

      it 'run gengiscan over localhost' do
        post "/api/v1/gengiscan", "host"=>"localhost"
        last_response.status.should == 201
        hash = JSON.parse(last_response.body)
        hash["status"].should == "OK"
      end

      it 'run gengiscan over localhost on a port different than 80' do
        post "/api/v1/gengiscan", "host"=>"localhost", "port"=>"4000"

        last_response.status.should == 201
        hash = JSON.parse(last_response.body)
        hash["status"].should == "OK"
      end
    end
  end
end

