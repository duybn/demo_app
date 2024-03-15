require 'rails_helper'

describe SharedVideosController, type: :controller do
  let(:user) { create(:user) }

  describe "GET index" do
    let!(:shared_videos) { create_list(:shared_video, 3, user: user)}

    context 'with access token' do
      it "returns the list" do
        sign_in(user)
        get :index

        expect(response.status).to eq(200)
        expect(JSON.parse(response.body)['shared_videos'].length).to eq(3)
      end
    end

    context 'without access token' do
      it "does not returns the list" do
        get :index

        expect(response.status).to eq(401)
      end
    end
  end

  describe "POST" do
    context 'with access token' do
      it "create new record" do
        sign_in(user)
        post :create, { params: { youtube_url: 'https://example1.com' } }

        expect(response.status).to eq(200)
        expect(SharedVideo.all.length).to eq(1)
      end
    end

    context 'without access token' do
      it "does not create new record" do
        post :create, { params: { youtube_url: 'https://example1.com' } }

        expect(response.status).to eq(401)
      end
    end
  end
end
