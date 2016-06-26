class SoundtracksController < ApplicationController
  def index
    @tracks = Track.where(channel_id: params[:channel_id]).page(params[:page])
    render json: @tracks
  end
end