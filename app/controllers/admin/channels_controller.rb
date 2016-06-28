class Admin::ChannelsController < ApplicationController
  # before_action :authenticate_listener!
  # before_action :authorize_admin!

  def index
    @channels = Channel.all
  end

  def show
    @channel = get_channel
  end

  private

  def authorize_admin!
    unless current_listener.is_admin?
      redirect_to root_path
    end
  end

  def get_channel
    channel = Channel.find params[:id]
  end
end
