class Euler < ActiveRecord::Base
	require 'bigdecimal'
	require "rational"


	def self.factorial(num)
		value = Rational(1,1)
		for i in 1..num
			value *= Rational(i,1)
		end
		value
	end


	def self.calce(r) 
		@e = Rational(1/1)
		for i in 1..r
			fact = Rational(Euler.factorial(i),1)
			@e += Rational(1,fact)
		end
		"%.300f" % @e
	end
	
	def self.is_prime?(n)
	   Math.sqrt(n).floor.downto(2).each {|i| return false if n % i == 0}
	   return false if n == 1 || n == 0
	   true
	end

	def self.calc(x,y)
		e = calce(500)
		arr = []
	    for i in 1..300
	        num = e.to_s[i...i+y].to_i
	        if num.to_s.length == y && is_prime?(num) 
	            arr << num
	        end
	        break if arr.length == x
	    end
	    arr[x-1]
	end

	def self.filter(a)
		if a == Euler.calc(Euler.last.x,Euler.last.y)
			return a
		end
	end

	

end
