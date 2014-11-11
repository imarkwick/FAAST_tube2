require 'passenger_holder'

class Holder; include PassengerHolder; end

describe 'PassengerHolder' do
	
	let(:holder) {Holder.new}
	let(:passenger1) {double :passenger, balance: 10}
	let(:passenger2) {double :passenger, balance: 10}

	it 'should let a passenger enter' do
		expect{holder.let_in(passenger1)}.to change{holder.passenger_count}.by 1
	end

	it 'should let a passenger exit' do
		holder.let_in(passenger1)
		holder.let_in(passenger2)
		expect(holder.passenger_count).to eq 2
		holder.let_out(passenger1)
		expect(holder.passenger_count).to eq 1
	end

	it 'should know when it is full' do
		40.times {holder.let_in(passenger1)}
		expect(holder).to be_full
	end

	it 'should not allow passengers to enter if full' do
		40.times {holder.let_in(passenger1)}
		expect{holder.let_in(passenger2)}.to raise_error(RuntimeError)
	end
end