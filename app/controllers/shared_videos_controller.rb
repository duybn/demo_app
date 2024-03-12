class SharedVideosController < ApplicationController
  before_action :authenticate_user!

  def create
    shared_video = SharedVideo.create(youtube_url: params[:youtube_url], user: current_user)

    if shared_video.persisted?
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
    render json: {
      status: 200,
      message: SharedVideo.all
    }, status: :ok
  end
end
