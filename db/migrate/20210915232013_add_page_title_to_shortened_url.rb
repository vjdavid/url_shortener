class AddPageTitleToShortenedUrl < ActiveRecord::Migration[6.1]
  def change
    add_column :shortened_url, :page_title, :string
  end
end
