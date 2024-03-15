class SharedVideosChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'shared_videos_channel'
  end

  def unsubscribed
  end
end
