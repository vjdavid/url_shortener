class CreateShortenedUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :shortened_urls do |t|
      t.string :full_url, null: false, index: true
      t.string :code_url, null: false, index: true
      t.string :shortened_url, null: false, index: true

      t.timestamps
    end
  end
end
