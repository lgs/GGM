require 'spec_helper'
require File.join(File.dirname(__FILE__), '../', 'app')

describe App do
  def config_file
    File.expand_path(File.join(File.dirname(__FILE__), '..', 'config', 'app.rb'))
  end

  let(:api_options) { { :config => config_file } }

  it 'renders ' do
    with_api(App, api_options) do
      get_request(:path => '/v1/categories') do |c|
        #c.response.should == "Ruby Web Frameworks"
        resp = JSON.parse(c.response)
        resp.map{|r|r.should include("name"=>"Ruby Web Frameworks")}
      end
    end
  end
end
