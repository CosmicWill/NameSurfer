require 'sinatra'
require 'sinatra/reloader'
require 'slim'
require 'sass'
require './NameSurfer'

configure do
	set :dataArray, Array.new
end

get '/'  do
	settings.dataArray = Array.new
	erb	:home
end

