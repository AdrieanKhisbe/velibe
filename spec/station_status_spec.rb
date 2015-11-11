require 'spec_helper'


describe StationStatus do

  describe '#new' do

    context 'Can create Status with proper values' do

      let(:status) { StationStatus.new 'AB', available_bikes= 2, available_bike_stands=4 }

      it 'has proper name' do
        expect(status.name).to eq 'AB'
      end
      it 'has proper bike stand' do
        expect(status.available_bikes).to eq 2
      end
      it 'has proper bike' do
        expect(status.available_bike_stands).to eq 4
      end


    end

   describe 'from_hash' do

     context 'handle valid input values' do
        let(:data) { { name: 'station', available_bikes: 2, available_bike_stands:4 } }
        let(:status) { StationStatus.from_hash(data) }
        it 'capitalize station name' do expect(status.name).to eq 'Station' end
        it { expect(status.available_bikes).to eq 2 }

     end

     context 'wrong input values'
     # TODO: define which error to grab

   end

  end

  describe 'Boolean status working' do

  end

end
