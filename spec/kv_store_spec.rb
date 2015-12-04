require 'spec_helper'


describe Velibe::KvStore do


  before { Velibe::KvStore.db[Velibe::KvStore.fav_key] = [2, 3, 4] }
  let(:favorites) { Velibe::KvStore.favorite_stations }


  describe '#token' do
    let(:token) { Velibe::KvStore.token }
    context 'no token in conf' do
      before { Velibe::KvStore.db.delete 'token'}
      it { expect(token).to be_nil }
    end
    context 'with token in conf' do
      before { Velibe::KvStore.db['token'] = 'fake-test-value' }
      it { expect(token).to eq 'fake-test-value' }
    end
  end

  describe '#favorite_stations' do
    it { expect(favorites).to eq [2, 3, 4] }
  end

  describe '#reset_favorite_stations' do

    context 'default arguments' do
      before { Velibe::KvStore.reset_favorite_stations }
      it { expect(favorites).to eq [] }
    end

    context 'specific arguments' do
      before { Velibe::KvStore.reset_favorite_stations 12, 42 }
      it { expect(favorites).to eq [12, 42] }
    end

    context 'specific arguments as string' do
      before { Velibe::KvStore.reset_favorite_stations '33' }
      it { expect(favorites).to eq [33] }
    end

  end

  describe '#add_favorite_station' do
    before { Velibe::KvStore.add_favorite_station *new_fav }
    let(:final_fav) { Velibe::KvStore.favorite_stations }

    context 'single new favorite' do
      let(:new_fav) { 5 }
      it { expect(final_fav).to eq (2..5).to_a }
    end

    context 'list of favorites' do
      let(:new_fav) { (5..10).to_a }
      it { expect(final_fav).to eq (2..10).to_a }
    end

    context 'single new as string' do
      let(:new_fav) { '5' }
      it { expect(final_fav).to eq (2..5).to_a }
    end

    context 'ignore duplicates' do
      let(:new_fav) { (3..5).to_a }
      it { expect(final_fav).to eq (2..5).to_a }
    end

    context 'no values' do
      let(:new_fav) {}
      it { expect(final_fav).to eq (2..4).to_a }
    end


  end

end
