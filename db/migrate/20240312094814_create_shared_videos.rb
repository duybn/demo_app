class CreateSharedVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :shared_videos do |t|
      t.string :youtube_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
