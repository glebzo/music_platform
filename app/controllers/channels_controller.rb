class ChannelsController < ApplicationController
  before_action :get_channel, only: [:show]

  def index
    @channels = Channel.page(params[:page])
    render json: @channels
  end

  def show
    render json: @channel
  end

  def favorites

  end

  private

  def get_channel
    @channel = Channel.find(params[:id])
  end

end
