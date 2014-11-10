require 'passenger'

describe Passenger do  

	let(:passenger1) {Passenger.new}

	it 'can deduct money' do
		passenger1.deduct(2)
		expect(passenger1.balance).to eq (0.5)
	end
	it 'can top up' do
		passenger1.deduct(2)
		expect(passenger1.balance).to eq (0.5)
		passenger1.top_up(5)
		expect(passenger1.balance).to eq (5.5)
	end
end