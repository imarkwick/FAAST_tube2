require 'train'
require 'passenger_holder'

describe Train do
	
	let(:train) {Train.new}
	let(:carriage) {double :carriage}

	it 'can be initialized with 2 carriages' do
		expect(train.carriage_count).to eq 2
	end

	it 'can add a carriage' do
		train.add_carriage(carriage)
		expect(train.carriage_count).to eq 3
	end
end