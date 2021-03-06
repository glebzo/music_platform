require 'rails_helper'

RSpec.describe ChannelsController, type: :controller do
  it {should use_before_action(:get_channel) }

  describe '#index' do

    it 'renders first page of channels list with json' do
      channels = Array.new 2, build(:channel)
      allow(Channel).to receive(:page).with("1").and_return(channels)

      get :index, :page => 1

      expect(controller.params[:page]).to eq("1")
      expect(response.body).to eq(channels.to_json)
    end

  end

  describe '#show' do
    it 'renders a single channel with json' do
      channel = build(:channel)
      allow(Channel).to receive(:find).with("1").and_return(channel)

      get :show, :id => 1

      expect(response.body).to eq(channel.to_json)
    end
  end

end
