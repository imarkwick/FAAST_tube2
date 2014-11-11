require 'station'
require 'passenger_holder'
require 'passenger'

describe Station do 

	let(:station) {Station.new}
	let(:passenger) {double :passenger, balance: 8, deduct: 0}
	let(:passengerX) {double :passenger, balance: 1.00}
	let(:train) {double :train}

	it 'should let in a passenger' do
		expect{station.let_in(passenger)}.to change{station.passenger_count}.by 1
	end

	it 'should let out a passenger' do
		station.let_in(passenger)
		expect{station.let_out(passenger)}.to change{station.passenger_count}.by -1
	end

	it 'should only let a passenger in if they have enough credit' do
		allow(passenger).to receive(:balance).and_return 1
		expect{station.let_in(passenger)}.to raise_error "Top Up"
	end

	it 'should deduct 2.00 from the passenger balance' do
		expect(passenger).to receive(:deduct).with(2)
		station.let_in(passenger)
	end

	it 'should accept a train' do
		expect{station.accept_train(train)}.to change{station.train_count}.by 1
	end

	it 'should release a train' do
		station.accept_train(train)
		expect{station.release_train(train)}.to change{station.train_count}.by -1
	end

end