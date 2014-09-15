# setup: bundle install
# run: bundle exec ruby mock_server.rb 

require 'rubygems'
require 'sinatra'
require 'json'

MOCK_PRODUCTS = ["samsung galaxy", "Nexus 7",
	"Ipad 8 inch"]

get '/products' do
  {"pupils" => MOCK_PRODUCTS}.to_json
end