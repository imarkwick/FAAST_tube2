require 'station'
require 'passenger_holder'

describe Station do 

	let(:station) {Station.new}
	let(:passenger) {double :passenger, balance: 8, deduct: 2}
	let(:bob) {double :passenger, balance: 5, deduct: 2}
	let(:carriage) {double :carriage, let_in: passenger}
	let(:train) {double :train}

	it 'should let in a passenger' do
		expect{station.let_in(passenger)}.to change{station.passenger_count}.by 1
	end

	it 'should have a passenger in the station once let in' do
		station.let_in(bob)
		expect(station.passengers).to eq([bob])
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

	it 'should know that passenger leaves the station when boarding carriage' do
		expect{station.let_in(passenger)}.to change{station.passenger_count}.by 1
		allow(carriage).to receive(:let_in).with(passenger)
		station.passenger_board(carriage)
		expect(station.passenger_count).to eq 0
	end
end