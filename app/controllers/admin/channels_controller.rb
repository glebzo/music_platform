class Admin::ChannelsController < ApplicationController
  before_action :authenticate_listener!
  # before_action :check_is_admin?

  def index
    @channels = Channel.all
  end

  def show
    @channel = get_channel
  end

  private

  def check_is_admin?
    if current_listener.is_admin?
      true
    else
      false
    end
  end

  def get_channel
    channel = Channel.find params[:id]
  end
end
