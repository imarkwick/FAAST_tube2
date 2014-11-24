module PassengerHolder

	DEFAULT_CAPACITY = 40
	attr_writer :capacity

	def passengers
		@passengers ||= []
	end

	def passenger_count
		passengers.count
	end

	def let_in(passenger)
		raise 'Top Up' if passenger.balance < 2
		raise 'This carriage is full' if full?
		passengers << passenger
	end

	def let_out(passenger)
		passengers.delete(passenger)
	end

	def full?
		passenger_count == DEFAULT_CAPACITY
	end

	def capacity
		capacity ||= DEFAULT_CAPACITY
	end
end