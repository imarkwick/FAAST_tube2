require_relative 'passenger_holder'

class Station

	include PassengerHolder

	attr_reader :train
	attr_reader :passengers

	DEFAULT_CAPACITY = 100

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@passengers = []
		@trains = []
	end
end