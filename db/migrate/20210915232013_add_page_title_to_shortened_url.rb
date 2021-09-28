class AddPageTitleToShortenedUrl < ActiveRecord::Migration[6.1]
  def change
    add_column :shortened_urls, :page_title, :string
  end
end
