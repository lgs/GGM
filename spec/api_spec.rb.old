require 'spec_helper'
require 'yajl/json_gem'

describe API do
  include Rack::Test::Methods

  def app
    API
  end

  describe API do
    describe 'GET /v1/categories' do
      it 'get several categories of repositories by name' do
        get "/v1/categories"
        last_response.status.should == 200
        JSON.parse(last_response.body)["name"].should == "Ruby Web Frameworks"
        JSON.parse(last_response.body)["name"].should == "Content Management Systems"
        JSON.parse(last_response.body)["name"].should == "Cloud Computing"
        JSON.parse(last_response.body)["name"].should == "A/B Testing"
        JSON.parse(last_response.body)["name"].should == "E-Commerce"
      end
    end

    describe 'GET /v1/categories' do
      it 'returns a 404 error if no host is provided' do
        get "/v1/categories"
        last_response.status.should == 404
      end

      it 'run categories over localhost' do
        post "/v1/categories", "host"=>"localhost"
        last_response.status.should == 201
        hash = JSON.parse(last_response.body)
        hash["status"].should == "OK"
      end

      it 'run categories over localhost on a port different than 80' do
        post "/v1/categories", "host"=>"localhost", "port"=>"4000"

        last_response.status.should == 201
        hash = JSON.parse(last_response.body)
        hash["status"].should == "OK"
      end
    end
  end
end

