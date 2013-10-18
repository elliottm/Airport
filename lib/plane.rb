class Plane

	def initialize 
	  land
	end

	def flying? 
	  @flying
	end

	def take_off
	  @flying = true
	end

	def land
	  @flying = false
	end


end

