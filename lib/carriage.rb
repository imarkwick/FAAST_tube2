require_relative 'passenger_holder'

class Carriage

	include PassengerHolder

	attr_reader :passengers

	DEFAULT_CAPACITY = 40

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@passengers = []
	end
end