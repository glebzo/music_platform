class SoundtracksController < ApplicationController
  def index
    @tracks = Soundtrack.where(channel_id: params[:channel_id]).page(params[:page])
    render json: @tracks
  end
end