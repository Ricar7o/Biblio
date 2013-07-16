class AddCoverPictureToBooks < ActiveRecord::Migration
  def change
    add_column :Books, :cover_picture, :string
  end
end
