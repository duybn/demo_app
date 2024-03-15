require 'rails_helper'

describe User do
  it do
    expect(subject).to have_many :shared_videos
  end
end
