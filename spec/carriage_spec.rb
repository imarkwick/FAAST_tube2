require 'carriage'
require 'passenger_holder'

describe Carriage do
	
	let(:carriage) {Carriage.new}
	let(:passenger) {double :passenger}

	it 'has a default capacity of 40' do
		expect(carriage.capacity).to eq 40
	end

	# it should allow a passenger to board

	# it should allow a passenger to alight

	# it should know when it is full

	# it should reject a passenger if full 

end