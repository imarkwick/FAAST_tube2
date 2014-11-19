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

# questions from playing in irb.....
# (1) station.capacity is returning 40 instead of 100
# (2) when the station accepts 2 trains, the train count is 2, but when it releases 1, the train count goes to 0
# (3) still to do - make station let out passenger as carriage let's in passenger