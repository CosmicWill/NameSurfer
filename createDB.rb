require 'sqlite3'

def parseFile()
	filename = "names-data.txt"
	contents = open(filename, 'r') {|f| f.read}
end

def splitDef(raw_def)
	output = Array.new
	raw_def = raw_def.to_s
	raw_def = raw_def.split("\n")
	raw_def.each do |str|
		str = str.split(" ")
		output.push(str)
	end
	output
end


begin
	db = SQLite3::Database.new "Names.db"
	db.execute "CREATE TABLE IF NOT EXISTS Names(
	ID INTEGER PRIMARY KEY AUTOINCREMENT,
	Name STRING, 
	year1900 INTEGER, 
	year1910 INTEGER,
	year1920 INTEGER, 
	year1930 INTEGER,
	year1940 INTEGER,
	year1950 INTEGER,
	year1960 INTEGER,
	year1970 INTEGER,
	year1980 INTEGER,
	year1990 INTEGER,
	year2000 INTEGER)"

	splitDef(parseFile()).each do |str|
		#print str[1,11].join(",")
		db.execute "INSERT INTO Names
		(Name,
		year1900,
		year1910,
		year1920,
		year1930,
		year1940,
		year1950,
		year1960,
		year1970,
		year1980,
		year1990,
		year2000) 
		VALUES( '#{str[0]}' ," + str[1,11].join(",") + ")" 

	end

rescue SQLite3::Exception => e
	puts "Expection occured"
	puts e

ensure
	db.close if db
end

