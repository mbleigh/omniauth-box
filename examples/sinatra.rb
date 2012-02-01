$:.push File.dirname(__FILE__) + '/../lib'

require 'omniauth-box'
require 'sinatra'

use Rack::Session::Cookie
use OmniAuth::Strategies::Box, ENV['BOX_KEY']

get '/' do
  "<a href='/auth/box'>Log in with Box</a>"
end

get '/auth/box/callback' do
  content_type 'text/plain'
  request.env['omniauth.auth'].inspect
end