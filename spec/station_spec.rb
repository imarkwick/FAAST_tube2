require 'station'
require 'passenger_holder'

describe Station do 

	let(:station) {Station.new}
	let(:passenger) {double :passenger}
	let(:passengerX) {double :passenger, balance: 1.00}
	let(:train) {double :train}

	it 'should let in a passenger' do
		expect{station.let_in(passenger)}.to change{station.passenger_count}.by 1
	end

	# it should only let a passenger in if they have enough credit

	# it should let out a passenger

	# it should deduct 2.00 from the passenger balance

	# it should accept a train

	# it should release a train

end