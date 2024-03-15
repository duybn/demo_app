FactoryBot.define do
  factory :shared_video do
    youtube_url { 'https://example.com' }
    user
  end
end
