require 'sinatra'
require 'omniauth'
require 'omniauth-rdio'

RDIO_CONSUMER_KEY = 'your consumer key'
RDIO_SECRET = 'your secret'

use Rack::Session::Cookie
use OmniAuth::Builder do
  provider :rdio, RDIO_CONSUMER_KEY, RDIO_SECRET
end

get '/' do
  <<-HTML
  <a href="/auth/rdio">Authenticate with Rdio</a>
  HTML
end

get '/auth/:name/callback' do
  auth = request.env['omniauth.auth']

  puts auth

  "You authenticated something fierce! Check the logs..."
end


