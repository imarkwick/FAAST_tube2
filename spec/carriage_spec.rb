require 'carriage'
require 'passenger_holder'

describe Carriage do
	
	let(:carriage) { Carriage.new }
	let(:passenger) { double :passenger, balance: 10 }
	let(:station) { double :station }

	it 'has a default capacity of 40' do
		expect(carriage.capacity).to eq 40
	end

	it 'should allow a passenger to board' do
		carriage.let_in(passenger)
		expect(carriage.passenger_count).to eq 1
	end

	it 'should allow a passenger to alight' do
		carriage.let_in(passenger)
		expect{carriage.let_out(passenger)}.to change{carriage.passenger_count}.by -1
	end

	it 'should know when it is full' do
		40.times {carriage.let_in(passenger)}
		expect(carriage).to be_full
	end

	it 'should reject a passenger if full' do
		40.times {carriage.let_in(passenger)}
		expect{carriage.let_in(passenger)}.to raise_error(RuntimeError)
	end 

	# it 'removes a passenger from station when let in' do
	# 	station.let_in(passenger)
	# 	expect{carriage.let_in(passenger)}.to change{station.passenger_count}.by -1
	# end
end