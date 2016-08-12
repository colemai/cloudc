class Spreadsheet < ActiveRecord::Base

	def self.import(file)
		CSV.foreach(file.path, headers: false) do |row|
			  hash = {
			    col_a: row[0],
			    col_b: row[1]
			    }
  			Spreadsheet.create!(hash)
        end
	end
end


