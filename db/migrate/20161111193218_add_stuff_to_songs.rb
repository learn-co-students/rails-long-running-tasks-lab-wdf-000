class AddStuffToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :title, :string
    add_column :songs, :artist_name, :string
    add_column :songs, :release_year, :string
    add_column :songs, :combined, :string
    add_column :songs, :first, :string
    add_column :songs, :year, :string
    add_column :songs, :play_count, :string
    add_column :songs, :f_g, :string
  end
end
