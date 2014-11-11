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

	def let_in(passenger)
		super
		passenger.deduct(2)
	end

	def accept_train(train)
		@trains << train
	end

	def release_train(train)
		@trains.delete(train)
	end

	def train_count
		@trains.count
	end
end