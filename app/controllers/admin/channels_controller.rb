class Admin::ChannelsController < ApplicationController
  before_action :authenticate_listener!
  before_action :authorize_admin!

  before_action :get_channel, only: [:show, :edit, :update]

  def index
    @channels = Channel.all
  end

  def show

  end

  def edit

  end

  def update
    if @channel.update(channel_params)
      redirect_to admin_channel_path(@channel)
      flash[:notice] = 'Successfully updated'
    else
      render :edit
    end
  end

  private

  def authorize_admin!
    unless current_listener.is_admin?
      redirect_to root_path
    end
  end

  def get_channel
    @channel = Channel.find params[:id]
  end

  def channel_params
    params.require(:channel).permit(:name, :description, :image)
  end
end
