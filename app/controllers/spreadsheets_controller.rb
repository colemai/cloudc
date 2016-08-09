class SpreadsheetsController < ApplicationController
  
  def index
  	
  end

  
  def import
  	csv_rows = CSV.read(params[:file])
	@answers = Array.new
	csv_rows.each do |row|
	@answers << row[1] + row[2] 
	@answers      
    end
  end

end
