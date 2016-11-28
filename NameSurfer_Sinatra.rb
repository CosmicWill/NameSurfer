require 'sinatra'
require 'sinatra/reloader' 
require 'slim'
require 'sass'
require './NameSurfer'

get '/'  do
	erb	:home
end

get '/NameSurfer' do
	#if(found)
		erb :graph
	#else
		#erb :notFound

end
