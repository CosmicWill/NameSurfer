require 'dm-core'
require 'dm-migrations'
#require 'dm-sqlite-adapter'

def foundName?(inputName)
	@names.each do |entry|
		if inputName == entry.Name
			@year1900 = entry.year1900
			@year1910 = entry.year1910
			@year1920 = entry.year1920
			@year1930 = entry.year1930
			@year1940 = entry.year1940
			@year1950 = entry.year1950
			@year1960 = entry.year1960
			@year1970 = entry.year1970
			@year1980 = entry.year1980
			@year1990 = entry.year1990
			@year2000 = entry.year2000
			return true
		end
	end
	return false
end


configure do 
	DataMapper.setup(:default,"sqlite://#{Dir.pwd}/Names.db")
end

class Name
	include DataMapper::Resource
	property :ID, Serial
	property :Name, String
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


get '/NameSurfer' do
	@names = Name.all
	if(params['name'])
		@name = params['name']
		@name = @name.gsub(/|^A-Za-z\-|/,'')
		if foundName?(@name)
			erb :graph
		else
			erb :notFound
		end
	end
end

#Searches database for name information
#Returns boolean depending if the name is found. 



