require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/reloader' if development?
require_relative './controllers/game_controller.rb'

use Rack::Reloader
use Rack::MethodOverride
run App
