require_relative 'passenger_holder'

class Carriage

	include PassengerHolder

	attr_accessor :passengers

	DEFAULT_CAPACITY = 40

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@passengers = []
	end

	# def let_in(passenger)
	# 	station.let_out(passenger)
	# 	super
	# end
end