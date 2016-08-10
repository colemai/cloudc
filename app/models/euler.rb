class Euler < ActiveRecord::Base

	@e = 2718281828459045235360287471352662497757247093699959574966967627724076630353547594571382178525166427427466391932003059921817413596629043572900334295260595630738132328627
	$prime = 0


	def self.is_prime?(n)
	   Math.sqrt(n).floor.downto(2).each {|i| return false if n % i == 0}
	   true
	end

	def self.ite(x,y)
		@e = 2718281828459045235360287471352662497757247093699959574966967627724076630353547594571382178525166427427466391932003059921817413596629043572900334295260595630738132328627
	    arr = []
	    for i in 0..175
	        num = @e.to_s[i...i+y].to_i
	        if num.to_s.length == y && is_prime?(num)
	            arr << num
	        end
	        break if arr.length == x
	    end
	    arr[x-1]
	    
	end

	def self.mite(a,b)
		if a == Euler.ite(Euler.last.x,Euler.last.y)
			return a
		elsif b == Euler.ite(Euler.last.x,Euler.last.y)
			return b
		end
	end

end
