class SharedVideosController < ApplicationController
  before_action :authenticate_user!

  def create
    shared_video = SharedVideo.create(youtube_url: params[:youtube_url], user: current_user)

    if shared_video.persisted?
      ActionCable.server.broadcast 'shared_videos_channel', ::SharedVideoSerializer.new(shared_video).serializable_hash[:data][:attributes]

      render json: {
        status: 200,
        message: 'Shared video successfully'
      }, status: :ok
    else
      render json: {
        status: {message: "Error: #{shared_video.errors.full_messages.to_sentence}"}
      }, status: :unprocessable_entity
    end
  end

  def index
    shared_videos_transform = SharedVideo.all.map{|shared_video| ::SharedVideoSerializer.new(shared_video).serializable_hash[:data][:attributes]}

    render json: {
      status: 200,
      shared_videos: shared_videos_transform
    }, status: :ok
  end
end
