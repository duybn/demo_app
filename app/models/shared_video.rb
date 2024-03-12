class SharedVideo < ApplicationRecord
  belongs_to :user

  validates :youtube_url,
    presence: true,
    format: { with: /\A(?:https?:\/\/)?(?:www\.)?(?:youtube\.com\/(?:[^\/\n\s]+\/\S+\/|watch\?v=|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11})\b/,
    message: "Invalid YouTube link"
   }
end
