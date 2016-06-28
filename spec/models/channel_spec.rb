require 'rails_helper'

RSpec.describe Channel, type: :model do
  it { should have_many :soundtracks}
  it { should have_many :albums }
  it { should have_many :artists }

  describe '#soundtracks_count' do
    it 'should return number of soundtracks for channel' do
      channel = build(:channel)
      soundtracks = [Soundtrack.new] * 2
      channel.soundtracks << soundtracks

      result = channel.soundtracks_count

      expect(result).to eq(2)
    end

    it 'should return number of albums for channel' do
      channel = build(:channel)
      albums = [Album.new] * 2
      channel.albums << albums

      result = channel.albums_count

      expect(result).to eq(2)
    end
  end
end
