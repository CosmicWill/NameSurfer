require 'dm-core'
require 'dm-migrations'
#require 'dm-sqlite-adapter'

configure do 
	DataMapper.setup(:default,"sqlite://./Names.db")
end

class Name
	include DataMapper::Resource
	property :ID, Serial
	property :Name, Text
	property :year1900, Integer
	property :year1910, Integer
	property :year1920, Integer
	property :year1930, Integer
	property :year1940, Integer
	property :year1950, Integer
	property :year1960, Integer
	property :year1970, Integer
	property :year1980, Integer
	property :year1990, Integer
	property :year2000, Integer

end

DataMapper.finalize()

post '/NameSurfer' do 
	@names = Name.all
end

#Searches database for name information
#Returns boolean depending if the name is found. 
def foundName?(name)

end


