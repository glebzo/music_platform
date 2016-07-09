class ChannelsController < ApplicationController
  before_action :get_channel, only: [:show]

  respond_to :json
  def index
    @channels = Channel.page(params[:page])
  end

  def show
    render json: @channel
  end

  private

  def get_channel
    @channel = Channel.find(params[:id])
  end

end
