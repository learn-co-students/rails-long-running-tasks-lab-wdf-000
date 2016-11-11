class AddColumnsToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :release_year, :string
    add_column :songs, :first, :string
    add_column :songs, :year, :string
    add_column :songs, :play_count, :string
    add_column :songs, :f_g, :string
  end
end
