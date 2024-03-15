class SharedVideoSerializer
  include JSONAPI::Serializer
  attributes :youtube_url, :user_email
end
