class Train

	attr_accessor :carriages

	def initialize()
		@carriages ||= [Carriage.new, Carriage.new]
	end

	def carriage_count
		carriages.count
	end

	def add_carriage(carriage)
		carriages << carriage
	end

	def release_carriage(carriage)
		carriages.delete(carriage)
	end	
end