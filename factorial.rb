class Factorial 
	attr_accessor :sum
	def initializa
		@sum = sum
	end
	def fac(x) 
		if x == 1
			puts sum
			exit 
		else	
			x -= 1 
			@sum += x  *  @sum
			fac(x) 
		end
		puts sum
	end	
end

f = Factorial.new
f.fac(30)
#6
#1