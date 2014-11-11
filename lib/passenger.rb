require_relative 'station'

class Passenger

	DEFAULT_BALANCE = 2.50
	attr_reader :balance

	def initialize(options = {})
		@balance = options.fetch(:balance, DEFAULT_BALANCE)
	end

	def deduct(amount)
		@balance -= amount
	end

	def top_up(amount)
		@balance += amount
	end

end