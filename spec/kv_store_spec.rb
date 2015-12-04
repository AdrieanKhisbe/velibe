require 'spec_helper'


describe Velibe::KvStore do


  describe '#token' do
    let(:token) { Velibe::KvStore.token }
    context 'no token in conf' do
      it { expect(token).to be_nil }
    end
    context 'wit token in conf' do
      before { Velibe::KvStore.db['token'] = 'fake-test-value' }
      it { expect(token).to eq 'fake-test-value' }
    end
  end

  describe '#favorite_stations' do
    before {Velibe::KvStore.db[Velibe::KvStore.fav_key] = [2, 3, 4] }
    it { expect(favorites).to eq [2, 3, 4]  }
  end

  describe '#reset_favorite_stations' do
    before do
      Velibe::KvStore.db[Velibe::KvStore.fav_key] = [2, 3, 4]
    end
    let(:favorites) { Velibe::KvStore.favorite_stations }

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
    

  end

end
