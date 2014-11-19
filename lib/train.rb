require_relative 'passenger_holder'

class Train

	include PassengerHolder
	attr_accessor :carriage

	def initialize()
		@carriages ||= [Carriage.new, Carriage.new]
	end

	def carriage_count
		@carriages.count
	end

	def add_carriage(carriage)
		@carriages << Carriage
	end

	# def release_carriage(carriage)
	# 	@carriages.delete(carriage)
	# end	
end