require 'rails_helper'

RSpec.describe SoundtracksController, type: :controller do
  describe '#index' do
    it 'should render tracks for a channel with json' do
      tracks = [{ :name => 'Heio' }, { :name => 'Maio' }]
      allow(Track).to receive(:page).and_return(tracks)

      get :index, channel_id: 1

      expect(response.body).to eq(tracks.to_json)
    end
  end

end
